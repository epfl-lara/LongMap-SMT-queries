; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71852 () Bool)

(assert start!71852)

(declare-fun b_free!13519 () Bool)

(declare-fun b_next!13519 () Bool)

(assert (=> start!71852 (= b_free!13519 (not b_next!13519))))

(declare-fun tp!47354 () Bool)

(declare-fun b_and!22615 () Bool)

(assert (=> start!71852 (= tp!47354 b_and!22615)))

(declare-datatypes ((V!25307 0))(
  ( (V!25308 (val!7662 Int)) )
))
(declare-datatypes ((tuple2!10098 0))(
  ( (tuple2!10099 (_1!5060 (_ BitVec 64)) (_2!5060 V!25307)) )
))
(declare-fun lt!378786 () tuple2!10098)

(declare-fun b!834569 () Bool)

(declare-fun lt!378788 () tuple2!10098)

(declare-datatypes ((List!15867 0))(
  ( (Nil!15864) (Cons!15863 (h!17000 tuple2!10098) (t!22230 List!15867)) )
))
(declare-datatypes ((ListLongMap!8923 0))(
  ( (ListLongMap!8924 (toList!4477 List!15867)) )
))
(declare-fun lt!378783 () ListLongMap!8923)

(declare-fun lt!378779 () ListLongMap!8923)

(declare-fun e!465655 () Bool)

(declare-fun +!1998 (ListLongMap!8923 tuple2!10098) ListLongMap!8923)

(assert (=> b!834569 (= e!465655 (= lt!378783 (+!1998 (+!1998 lt!378779 lt!378786) lt!378788)))))

(declare-fun res!567227 () Bool)

(declare-fun e!465654 () Bool)

(assert (=> start!71852 (=> (not res!567227) (not e!465654))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71852 (= res!567227 (validMask!0 mask!1312))))

(assert (=> start!71852 e!465654))

(declare-fun tp_is_empty!15229 () Bool)

(assert (=> start!71852 tp_is_empty!15229))

(declare-datatypes ((array!46635 0))(
  ( (array!46636 (arr!22347 (Array (_ BitVec 32) (_ BitVec 64))) (size!22767 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46635)

(declare-fun array_inv!17837 (array!46635) Bool)

(assert (=> start!71852 (array_inv!17837 _keys!976)))

(assert (=> start!71852 true))

(declare-datatypes ((ValueCell!7199 0))(
  ( (ValueCellFull!7199 (v!10110 V!25307)) (EmptyCell!7199) )
))
(declare-datatypes ((array!46637 0))(
  ( (array!46638 (arr!22348 (Array (_ BitVec 32) ValueCell!7199)) (size!22768 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46637)

(declare-fun e!465657 () Bool)

(declare-fun array_inv!17838 (array!46637) Bool)

(assert (=> start!71852 (and (array_inv!17838 _values!788) e!465657)))

(assert (=> start!71852 tp!47354))

(declare-fun mapNonEmpty!24506 () Bool)

(declare-fun mapRes!24506 () Bool)

(declare-fun tp!47353 () Bool)

(declare-fun e!465652 () Bool)

(assert (=> mapNonEmpty!24506 (= mapRes!24506 (and tp!47353 e!465652))))

(declare-fun mapRest!24506 () (Array (_ BitVec 32) ValueCell!7199))

(declare-fun mapKey!24506 () (_ BitVec 32))

(declare-fun mapValue!24506 () ValueCell!7199)

(assert (=> mapNonEmpty!24506 (= (arr!22348 _values!788) (store mapRest!24506 mapKey!24506 mapValue!24506))))

(declare-fun b!834570 () Bool)

(declare-fun e!465656 () Bool)

(assert (=> b!834570 (= e!465656 tp_is_empty!15229)))

(declare-fun e!465659 () Bool)

(declare-fun lt!378790 () ListLongMap!8923)

(declare-fun b!834571 () Bool)

(assert (=> b!834571 (= e!465659 (= lt!378783 (+!1998 (+!1998 lt!378790 lt!378788) lt!378786)))))

(declare-fun lt!378778 () ListLongMap!8923)

(declare-fun lt!378781 () ListLongMap!8923)

(assert (=> b!834571 (and (= lt!378778 lt!378781) (= lt!378783 lt!378781) (= lt!378783 lt!378778))))

(declare-fun lt!378784 () ListLongMap!8923)

(assert (=> b!834571 (= lt!378781 (+!1998 lt!378784 lt!378788))))

(declare-fun lt!378780 () ListLongMap!8923)

(assert (=> b!834571 (= lt!378778 (+!1998 lt!378780 lt!378788))))

(declare-datatypes ((Unit!28584 0))(
  ( (Unit!28585) )
))
(declare-fun lt!378789 () Unit!28584)

(declare-fun zeroValueBefore!34 () V!25307)

(declare-fun zeroValueAfter!34 () V!25307)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!251 (ListLongMap!8923 (_ BitVec 64) V!25307 V!25307) Unit!28584)

(assert (=> b!834571 (= lt!378789 (addSameAsAddTwiceSameKeyDiffValues!251 lt!378780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!834571 e!465655))

(declare-fun res!567223 () Bool)

(assert (=> b!834571 (=> (not res!567223) (not e!465655))))

(declare-fun lt!378785 () ListLongMap!8923)

(assert (=> b!834571 (= res!567223 (= lt!378785 lt!378784))))

(declare-fun lt!378782 () tuple2!10098)

(assert (=> b!834571 (= lt!378784 (+!1998 lt!378780 lt!378782))))

(assert (=> b!834571 (= lt!378780 (+!1998 lt!378790 lt!378786))))

(assert (=> b!834571 (= lt!378788 (tuple2!10099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465658 () Bool)

(assert (=> b!834571 e!465658))

(declare-fun res!567226 () Bool)

(assert (=> b!834571 (=> (not res!567226) (not e!465658))))

(assert (=> b!834571 (= res!567226 (= lt!378785 (+!1998 (+!1998 lt!378790 lt!378782) lt!378786)))))

(declare-fun minValue!754 () V!25307)

(assert (=> b!834571 (= lt!378786 (tuple2!10099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!834571 (= lt!378782 (tuple2!10099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2566 (array!46635 array!46637 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8923)

(assert (=> b!834571 (= lt!378783 (getCurrentListMap!2566 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!834571 (= lt!378785 (getCurrentListMap!2566 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!834572 () Bool)

(assert (=> b!834572 (= e!465657 (and e!465656 mapRes!24506))))

(declare-fun condMapEmpty!24506 () Bool)

(declare-fun mapDefault!24506 () ValueCell!7199)

(assert (=> b!834572 (= condMapEmpty!24506 (= (arr!22348 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7199)) mapDefault!24506)))))

(declare-fun b!834573 () Bool)

(assert (=> b!834573 (= e!465652 tp_is_empty!15229)))

(declare-fun mapIsEmpty!24506 () Bool)

(assert (=> mapIsEmpty!24506 mapRes!24506))

(declare-fun b!834574 () Bool)

(declare-fun res!567224 () Bool)

(assert (=> b!834574 (=> (not res!567224) (not e!465654))))

(declare-datatypes ((List!15868 0))(
  ( (Nil!15865) (Cons!15864 (h!17001 (_ BitVec 64)) (t!22231 List!15868)) )
))
(declare-fun arrayNoDuplicates!0 (array!46635 (_ BitVec 32) List!15868) Bool)

(assert (=> b!834574 (= res!567224 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15865))))

(declare-fun b!834575 () Bool)

(assert (=> b!834575 (= e!465658 (= lt!378783 (+!1998 (+!1998 lt!378779 (tuple2!10099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378786)))))

(declare-fun b!834576 () Bool)

(declare-fun res!567228 () Bool)

(assert (=> b!834576 (=> (not res!567228) (not e!465654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46635 (_ BitVec 32)) Bool)

(assert (=> b!834576 (= res!567228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!834577 () Bool)

(declare-fun res!567225 () Bool)

(assert (=> b!834577 (=> (not res!567225) (not e!465654))))

(assert (=> b!834577 (= res!567225 (and (= (size!22768 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22767 _keys!976) (size!22768 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!834578 () Bool)

(assert (=> b!834578 (= e!465654 (not e!465659))))

(declare-fun res!567222 () Bool)

(assert (=> b!834578 (=> res!567222 e!465659)))

(assert (=> b!834578 (= res!567222 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!834578 (= lt!378790 lt!378779)))

(declare-fun lt!378787 () Unit!28584)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!613 (array!46635 array!46637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 V!25307 V!25307 (_ BitVec 32) Int) Unit!28584)

(assert (=> b!834578 (= lt!378787 (lemmaNoChangeToArrayThenSameMapNoExtras!613 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2546 (array!46635 array!46637 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8923)

(assert (=> b!834578 (= lt!378779 (getCurrentListMapNoExtraKeys!2546 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!834578 (= lt!378790 (getCurrentListMapNoExtraKeys!2546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71852 res!567227) b!834577))

(assert (= (and b!834577 res!567225) b!834576))

(assert (= (and b!834576 res!567228) b!834574))

(assert (= (and b!834574 res!567224) b!834578))

(assert (= (and b!834578 (not res!567222)) b!834571))

(assert (= (and b!834571 res!567226) b!834575))

(assert (= (and b!834571 res!567223) b!834569))

(assert (= (and b!834572 condMapEmpty!24506) mapIsEmpty!24506))

(assert (= (and b!834572 (not condMapEmpty!24506)) mapNonEmpty!24506))

(get-info :version)

(assert (= (and mapNonEmpty!24506 ((_ is ValueCellFull!7199) mapValue!24506)) b!834573))

(assert (= (and b!834572 ((_ is ValueCellFull!7199) mapDefault!24506)) b!834570))

(assert (= start!71852 b!834572))

(declare-fun m!779825 () Bool)

(assert (=> start!71852 m!779825))

(declare-fun m!779827 () Bool)

(assert (=> start!71852 m!779827))

(declare-fun m!779829 () Bool)

(assert (=> start!71852 m!779829))

(declare-fun m!779831 () Bool)

(assert (=> b!834574 m!779831))

(declare-fun m!779833 () Bool)

(assert (=> b!834578 m!779833))

(declare-fun m!779835 () Bool)

(assert (=> b!834578 m!779835))

(declare-fun m!779837 () Bool)

(assert (=> b!834578 m!779837))

(declare-fun m!779839 () Bool)

(assert (=> b!834576 m!779839))

(declare-fun m!779841 () Bool)

(assert (=> b!834569 m!779841))

(assert (=> b!834569 m!779841))

(declare-fun m!779843 () Bool)

(assert (=> b!834569 m!779843))

(declare-fun m!779845 () Bool)

(assert (=> mapNonEmpty!24506 m!779845))

(declare-fun m!779847 () Bool)

(assert (=> b!834571 m!779847))

(declare-fun m!779849 () Bool)

(assert (=> b!834571 m!779849))

(declare-fun m!779851 () Bool)

(assert (=> b!834571 m!779851))

(assert (=> b!834571 m!779847))

(declare-fun m!779853 () Bool)

(assert (=> b!834571 m!779853))

(declare-fun m!779855 () Bool)

(assert (=> b!834571 m!779855))

(declare-fun m!779857 () Bool)

(assert (=> b!834571 m!779857))

(declare-fun m!779859 () Bool)

(assert (=> b!834571 m!779859))

(assert (=> b!834571 m!779853))

(declare-fun m!779861 () Bool)

(assert (=> b!834571 m!779861))

(declare-fun m!779863 () Bool)

(assert (=> b!834571 m!779863))

(declare-fun m!779865 () Bool)

(assert (=> b!834571 m!779865))

(declare-fun m!779867 () Bool)

(assert (=> b!834571 m!779867))

(declare-fun m!779869 () Bool)

(assert (=> b!834575 m!779869))

(assert (=> b!834575 m!779869))

(declare-fun m!779871 () Bool)

(assert (=> b!834575 m!779871))

(check-sat (not b!834576) (not b_next!13519) (not b!834571) (not b!834569) (not start!71852) (not b!834575) (not mapNonEmpty!24506) (not b!834578) tp_is_empty!15229 b_and!22615 (not b!834574))
(check-sat b_and!22615 (not b_next!13519))
