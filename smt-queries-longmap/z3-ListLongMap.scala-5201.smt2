; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70386 () Bool)

(assert start!70386)

(declare-fun b_free!12613 () Bool)

(declare-fun b_next!12613 () Bool)

(assert (=> start!70386 (= b_free!12613 (not b_next!12613))))

(declare-fun tp!44560 () Bool)

(declare-fun b_and!21411 () Bool)

(assert (=> start!70386 (= tp!44560 b_and!21411)))

(declare-fun b!816693 () Bool)

(declare-fun e!453005 () Bool)

(declare-fun e!453009 () Bool)

(assert (=> b!816693 (= e!453005 (not e!453009))))

(declare-fun res!557382 () Bool)

(assert (=> b!816693 (=> res!557382 e!453009)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816693 (= res!557382 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24099 0))(
  ( (V!24100 (val!7209 Int)) )
))
(declare-datatypes ((tuple2!9378 0))(
  ( (tuple2!9379 (_1!4700 (_ BitVec 64)) (_2!4700 V!24099)) )
))
(declare-datatypes ((List!15191 0))(
  ( (Nil!15188) (Cons!15187 (h!16322 tuple2!9378) (t!21504 List!15191)) )
))
(declare-datatypes ((ListLongMap!8203 0))(
  ( (ListLongMap!8204 (toList!4117 List!15191)) )
))
(declare-fun lt!365624 () ListLongMap!8203)

(declare-fun lt!365623 () ListLongMap!8203)

(assert (=> b!816693 (= lt!365624 lt!365623)))

(declare-fun zeroValueBefore!34 () V!24099)

(declare-datatypes ((Unit!27799 0))(
  ( (Unit!27800) )
))
(declare-fun lt!365621 () Unit!27799)

(declare-datatypes ((array!44847 0))(
  ( (array!44848 (arr!21477 (Array (_ BitVec 32) (_ BitVec 64))) (size!21897 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44847)

(declare-fun zeroValueAfter!34 () V!24099)

(declare-fun minValue!754 () V!24099)

(declare-datatypes ((ValueCell!6746 0))(
  ( (ValueCellFull!6746 (v!9636 V!24099)) (EmptyCell!6746) )
))
(declare-datatypes ((array!44849 0))(
  ( (array!44850 (arr!21478 (Array (_ BitVec 32) ValueCell!6746)) (size!21898 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44849)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!311 (array!44847 array!44849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 V!24099 V!24099 (_ BitVec 32) Int) Unit!27799)

(assert (=> b!816693 (= lt!365621 (lemmaNoChangeToArrayThenSameMapNoExtras!311 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2223 (array!44847 array!44849 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8203)

(assert (=> b!816693 (= lt!365623 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816693 (= lt!365624 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816694 () Bool)

(declare-fun res!557385 () Bool)

(assert (=> b!816694 (=> (not res!557385) (not e!453005))))

(assert (=> b!816694 (= res!557385 (and (= (size!21898 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21897 _keys!976) (size!21898 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816695 () Bool)

(declare-fun e!453008 () Bool)

(declare-fun tp_is_empty!14323 () Bool)

(assert (=> b!816695 (= e!453008 tp_is_empty!14323)))

(declare-fun b!816696 () Bool)

(declare-fun e!453006 () Bool)

(declare-fun mapRes!23071 () Bool)

(assert (=> b!816696 (= e!453006 (and e!453008 mapRes!23071))))

(declare-fun condMapEmpty!23071 () Bool)

(declare-fun mapDefault!23071 () ValueCell!6746)

(assert (=> b!816696 (= condMapEmpty!23071 (= (arr!21478 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6746)) mapDefault!23071)))))

(declare-fun b!816697 () Bool)

(declare-fun res!557384 () Bool)

(assert (=> b!816697 (=> (not res!557384) (not e!453005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44847 (_ BitVec 32)) Bool)

(assert (=> b!816697 (= res!557384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!557383 () Bool)

(assert (=> start!70386 (=> (not res!557383) (not e!453005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70386 (= res!557383 (validMask!0 mask!1312))))

(assert (=> start!70386 e!453005))

(assert (=> start!70386 tp_is_empty!14323))

(declare-fun array_inv!17225 (array!44847) Bool)

(assert (=> start!70386 (array_inv!17225 _keys!976)))

(assert (=> start!70386 true))

(declare-fun array_inv!17226 (array!44849) Bool)

(assert (=> start!70386 (and (array_inv!17226 _values!788) e!453006)))

(assert (=> start!70386 tp!44560))

(declare-fun b!816698 () Bool)

(declare-fun res!557381 () Bool)

(assert (=> b!816698 (=> (not res!557381) (not e!453005))))

(declare-datatypes ((List!15192 0))(
  ( (Nil!15189) (Cons!15188 (h!16323 (_ BitVec 64)) (t!21505 List!15192)) )
))
(declare-fun arrayNoDuplicates!0 (array!44847 (_ BitVec 32) List!15192) Bool)

(assert (=> b!816698 (= res!557381 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15189))))

(declare-fun b!816699 () Bool)

(declare-fun e!453007 () Bool)

(assert (=> b!816699 (= e!453007 tp_is_empty!14323)))

(declare-fun b!816700 () Bool)

(assert (=> b!816700 (= e!453009 true)))

(declare-fun lt!365620 () ListLongMap!8203)

(declare-fun getCurrentListMap!2337 (array!44847 array!44849 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8203)

(assert (=> b!816700 (= lt!365620 (getCurrentListMap!2337 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365622 () ListLongMap!8203)

(declare-fun +!1797 (ListLongMap!8203 tuple2!9378) ListLongMap!8203)

(assert (=> b!816700 (= lt!365622 (+!1797 (getCurrentListMap!2337 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23071 () Bool)

(assert (=> mapIsEmpty!23071 mapRes!23071))

(declare-fun mapNonEmpty!23071 () Bool)

(declare-fun tp!44559 () Bool)

(assert (=> mapNonEmpty!23071 (= mapRes!23071 (and tp!44559 e!453007))))

(declare-fun mapKey!23071 () (_ BitVec 32))

(declare-fun mapValue!23071 () ValueCell!6746)

(declare-fun mapRest!23071 () (Array (_ BitVec 32) ValueCell!6746))

(assert (=> mapNonEmpty!23071 (= (arr!21478 _values!788) (store mapRest!23071 mapKey!23071 mapValue!23071))))

(assert (= (and start!70386 res!557383) b!816694))

(assert (= (and b!816694 res!557385) b!816697))

(assert (= (and b!816697 res!557384) b!816698))

(assert (= (and b!816698 res!557381) b!816693))

(assert (= (and b!816693 (not res!557382)) b!816700))

(assert (= (and b!816696 condMapEmpty!23071) mapIsEmpty!23071))

(assert (= (and b!816696 (not condMapEmpty!23071)) mapNonEmpty!23071))

(get-info :version)

(assert (= (and mapNonEmpty!23071 ((_ is ValueCellFull!6746) mapValue!23071)) b!816699))

(assert (= (and b!816696 ((_ is ValueCellFull!6746) mapDefault!23071)) b!816695))

(assert (= start!70386 b!816696))

(declare-fun m!758727 () Bool)

(assert (=> b!816697 m!758727))

(declare-fun m!758729 () Bool)

(assert (=> b!816693 m!758729))

(declare-fun m!758731 () Bool)

(assert (=> b!816693 m!758731))

(declare-fun m!758733 () Bool)

(assert (=> b!816693 m!758733))

(declare-fun m!758735 () Bool)

(assert (=> b!816698 m!758735))

(declare-fun m!758737 () Bool)

(assert (=> b!816700 m!758737))

(declare-fun m!758739 () Bool)

(assert (=> b!816700 m!758739))

(assert (=> b!816700 m!758739))

(declare-fun m!758741 () Bool)

(assert (=> b!816700 m!758741))

(declare-fun m!758743 () Bool)

(assert (=> start!70386 m!758743))

(declare-fun m!758745 () Bool)

(assert (=> start!70386 m!758745))

(declare-fun m!758747 () Bool)

(assert (=> start!70386 m!758747))

(declare-fun m!758749 () Bool)

(assert (=> mapNonEmpty!23071 m!758749))

(check-sat (not b!816693) (not start!70386) b_and!21411 (not b!816697) (not b!816698) (not b!816700) (not b_next!12613) (not mapNonEmpty!23071) tp_is_empty!14323)
(check-sat b_and!21411 (not b_next!12613))
