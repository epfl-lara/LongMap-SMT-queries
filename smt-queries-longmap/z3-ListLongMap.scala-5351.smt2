; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71660 () Bool)

(assert start!71660)

(declare-fun b_free!13513 () Bool)

(declare-fun b_next!13513 () Bool)

(assert (=> start!71660 (= b_free!13513 (not b_next!13513))))

(declare-fun tp!47335 () Bool)

(declare-fun b_and!22573 () Bool)

(assert (=> start!71660 (= tp!47335 b_and!22573)))

(declare-fun b!833339 () Bool)

(declare-fun res!566712 () Bool)

(declare-fun e!464857 () Bool)

(assert (=> b!833339 (=> (not res!566712) (not e!464857))))

(declare-datatypes ((array!46591 0))(
  ( (array!46592 (arr!22330 (Array (_ BitVec 32) (_ BitVec 64))) (size!22751 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46591)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46591 (_ BitVec 32)) Bool)

(assert (=> b!833339 (= res!566712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833340 () Bool)

(declare-fun res!566711 () Bool)

(assert (=> b!833340 (=> (not res!566711) (not e!464857))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25299 0))(
  ( (V!25300 (val!7659 Int)) )
))
(declare-datatypes ((ValueCell!7196 0))(
  ( (ValueCellFull!7196 (v!10101 V!25299)) (EmptyCell!7196) )
))
(declare-datatypes ((array!46593 0))(
  ( (array!46594 (arr!22331 (Array (_ BitVec 32) ValueCell!7196)) (size!22752 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46593)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833340 (= res!566711 (and (= (size!22752 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22751 _keys!976) (size!22752 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833341 () Bool)

(declare-fun e!464852 () Bool)

(declare-fun tp_is_empty!15223 () Bool)

(assert (=> b!833341 (= e!464852 tp_is_empty!15223)))

(declare-fun b!833342 () Bool)

(declare-fun e!464858 () Bool)

(assert (=> b!833342 (= e!464858 tp_is_empty!15223)))

(declare-fun mapIsEmpty!24497 () Bool)

(declare-fun mapRes!24497 () Bool)

(assert (=> mapIsEmpty!24497 mapRes!24497))

(declare-fun res!566707 () Bool)

(assert (=> start!71660 (=> (not res!566707) (not e!464857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71660 (= res!566707 (validMask!0 mask!1312))))

(assert (=> start!71660 e!464857))

(assert (=> start!71660 tp_is_empty!15223))

(declare-fun array_inv!17847 (array!46591) Bool)

(assert (=> start!71660 (array_inv!17847 _keys!976)))

(assert (=> start!71660 true))

(declare-fun e!464855 () Bool)

(declare-fun array_inv!17848 (array!46593) Bool)

(assert (=> start!71660 (and (array_inv!17848 _values!788) e!464855)))

(assert (=> start!71660 tp!47335))

(declare-fun mapNonEmpty!24497 () Bool)

(declare-fun tp!47336 () Bool)

(assert (=> mapNonEmpty!24497 (= mapRes!24497 (and tp!47336 e!464858))))

(declare-fun mapRest!24497 () (Array (_ BitVec 32) ValueCell!7196))

(declare-fun mapKey!24497 () (_ BitVec 32))

(declare-fun mapValue!24497 () ValueCell!7196)

(assert (=> mapNonEmpty!24497 (= (arr!22331 _values!788) (store mapRest!24497 mapKey!24497 mapValue!24497))))

(declare-fun b!833343 () Bool)

(declare-fun e!464853 () Bool)

(declare-datatypes ((tuple2!10176 0))(
  ( (tuple2!10177 (_1!5099 (_ BitVec 64)) (_2!5099 V!25299)) )
))
(declare-datatypes ((List!15959 0))(
  ( (Nil!15956) (Cons!15955 (h!17086 tuple2!10176) (t!22321 List!15959)) )
))
(declare-datatypes ((ListLongMap!8989 0))(
  ( (ListLongMap!8990 (toList!4510 List!15959)) )
))
(declare-fun lt!378076 () ListLongMap!8989)

(declare-fun lt!378070 () ListLongMap!8989)

(assert (=> b!833343 (= e!464853 (= lt!378076 lt!378070))))

(declare-fun lt!378075 () ListLongMap!8989)

(assert (=> b!833343 (and (= lt!378070 lt!378075) (= lt!378076 lt!378075))))

(declare-fun lt!378069 () ListLongMap!8989)

(declare-fun lt!378067 () tuple2!10176)

(declare-fun +!2018 (ListLongMap!8989 tuple2!10176) ListLongMap!8989)

(assert (=> b!833343 (= lt!378075 (+!2018 lt!378069 lt!378067))))

(declare-fun lt!378064 () ListLongMap!8989)

(assert (=> b!833343 (= lt!378070 (+!2018 lt!378064 lt!378067))))

(declare-datatypes ((Unit!28515 0))(
  ( (Unit!28516) )
))
(declare-fun lt!378073 () Unit!28515)

(declare-fun zeroValueBefore!34 () V!25299)

(declare-fun zeroValueAfter!34 () V!25299)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!251 (ListLongMap!8989 (_ BitVec 64) V!25299 V!25299) Unit!28515)

(assert (=> b!833343 (= lt!378073 (addSameAsAddTwiceSameKeyDiffValues!251 lt!378064 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!464854 () Bool)

(assert (=> b!833343 e!464854))

(declare-fun res!566708 () Bool)

(assert (=> b!833343 (=> (not res!566708) (not e!464854))))

(declare-fun lt!378071 () ListLongMap!8989)

(assert (=> b!833343 (= res!566708 (= lt!378071 lt!378069))))

(declare-fun lt!378074 () tuple2!10176)

(assert (=> b!833343 (= lt!378069 (+!2018 lt!378064 lt!378074))))

(declare-fun lt!378066 () ListLongMap!8989)

(declare-fun lt!378072 () tuple2!10176)

(assert (=> b!833343 (= lt!378064 (+!2018 lt!378066 lt!378072))))

(assert (=> b!833343 (= lt!378067 (tuple2!10177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!464856 () Bool)

(assert (=> b!833343 e!464856))

(declare-fun res!566710 () Bool)

(assert (=> b!833343 (=> (not res!566710) (not e!464856))))

(assert (=> b!833343 (= res!566710 (= lt!378071 (+!2018 (+!2018 lt!378066 lt!378074) lt!378072)))))

(declare-fun minValue!754 () V!25299)

(assert (=> b!833343 (= lt!378072 (tuple2!10177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833343 (= lt!378074 (tuple2!10177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2558 (array!46591 array!46593 (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 (_ BitVec 32) Int) ListLongMap!8989)

(assert (=> b!833343 (= lt!378076 (getCurrentListMap!2558 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833343 (= lt!378071 (getCurrentListMap!2558 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!378068 () ListLongMap!8989)

(declare-fun b!833344 () Bool)

(assert (=> b!833344 (= e!464856 (= lt!378076 (+!2018 (+!2018 lt!378068 (tuple2!10177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378072)))))

(declare-fun b!833345 () Bool)

(declare-fun res!566713 () Bool)

(assert (=> b!833345 (=> (not res!566713) (not e!464857))))

(declare-datatypes ((List!15960 0))(
  ( (Nil!15957) (Cons!15956 (h!17087 (_ BitVec 64)) (t!22322 List!15960)) )
))
(declare-fun arrayNoDuplicates!0 (array!46591 (_ BitVec 32) List!15960) Bool)

(assert (=> b!833345 (= res!566713 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15957))))

(declare-fun b!833346 () Bool)

(assert (=> b!833346 (= e!464857 (not e!464853))))

(declare-fun res!566709 () Bool)

(assert (=> b!833346 (=> res!566709 e!464853)))

(assert (=> b!833346 (= res!566709 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!833346 (= lt!378066 lt!378068)))

(declare-fun lt!378065 () Unit!28515)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!607 (array!46591 array!46593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 V!25299 V!25299 (_ BitVec 32) Int) Unit!28515)

(assert (=> b!833346 (= lt!378065 (lemmaNoChangeToArrayThenSameMapNoExtras!607 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2537 (array!46591 array!46593 (_ BitVec 32) (_ BitVec 32) V!25299 V!25299 (_ BitVec 32) Int) ListLongMap!8989)

(assert (=> b!833346 (= lt!378068 (getCurrentListMapNoExtraKeys!2537 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833346 (= lt!378066 (getCurrentListMapNoExtraKeys!2537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833347 () Bool)

(assert (=> b!833347 (= e!464854 (= lt!378076 (+!2018 (+!2018 lt!378068 lt!378072) lt!378067)))))

(declare-fun b!833348 () Bool)

(assert (=> b!833348 (= e!464855 (and e!464852 mapRes!24497))))

(declare-fun condMapEmpty!24497 () Bool)

(declare-fun mapDefault!24497 () ValueCell!7196)

(assert (=> b!833348 (= condMapEmpty!24497 (= (arr!22331 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7196)) mapDefault!24497)))))

(assert (= (and start!71660 res!566707) b!833340))

(assert (= (and b!833340 res!566711) b!833339))

(assert (= (and b!833339 res!566712) b!833345))

(assert (= (and b!833345 res!566713) b!833346))

(assert (= (and b!833346 (not res!566709)) b!833343))

(assert (= (and b!833343 res!566710) b!833344))

(assert (= (and b!833343 res!566708) b!833347))

(assert (= (and b!833348 condMapEmpty!24497) mapIsEmpty!24497))

(assert (= (and b!833348 (not condMapEmpty!24497)) mapNonEmpty!24497))

(get-info :version)

(assert (= (and mapNonEmpty!24497 ((_ is ValueCellFull!7196) mapValue!24497)) b!833342))

(assert (= (and b!833348 ((_ is ValueCellFull!7196) mapDefault!24497)) b!833341))

(assert (= start!71660 b!833348))

(declare-fun m!777659 () Bool)

(assert (=> b!833343 m!777659))

(declare-fun m!777661 () Bool)

(assert (=> b!833343 m!777661))

(declare-fun m!777663 () Bool)

(assert (=> b!833343 m!777663))

(declare-fun m!777665 () Bool)

(assert (=> b!833343 m!777665))

(declare-fun m!777667 () Bool)

(assert (=> b!833343 m!777667))

(declare-fun m!777669 () Bool)

(assert (=> b!833343 m!777669))

(assert (=> b!833343 m!777661))

(declare-fun m!777671 () Bool)

(assert (=> b!833343 m!777671))

(declare-fun m!777673 () Bool)

(assert (=> b!833343 m!777673))

(declare-fun m!777675 () Bool)

(assert (=> b!833343 m!777675))

(declare-fun m!777677 () Bool)

(assert (=> start!71660 m!777677))

(declare-fun m!777679 () Bool)

(assert (=> start!71660 m!777679))

(declare-fun m!777681 () Bool)

(assert (=> start!71660 m!777681))

(declare-fun m!777683 () Bool)

(assert (=> b!833346 m!777683))

(declare-fun m!777685 () Bool)

(assert (=> b!833346 m!777685))

(declare-fun m!777687 () Bool)

(assert (=> b!833346 m!777687))

(declare-fun m!777689 () Bool)

(assert (=> b!833347 m!777689))

(assert (=> b!833347 m!777689))

(declare-fun m!777691 () Bool)

(assert (=> b!833347 m!777691))

(declare-fun m!777693 () Bool)

(assert (=> b!833344 m!777693))

(assert (=> b!833344 m!777693))

(declare-fun m!777695 () Bool)

(assert (=> b!833344 m!777695))

(declare-fun m!777697 () Bool)

(assert (=> b!833339 m!777697))

(declare-fun m!777699 () Bool)

(assert (=> mapNonEmpty!24497 m!777699))

(declare-fun m!777701 () Bool)

(assert (=> b!833345 m!777701))

(check-sat (not b!833345) (not mapNonEmpty!24497) (not b_next!13513) (not start!71660) (not b!833339) (not b!833344) tp_is_empty!15223 (not b!833343) (not b!833347) b_and!22573 (not b!833346))
(check-sat b_and!22573 (not b_next!13513))
