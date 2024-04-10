; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70670 () Bool)

(assert start!70670)

(declare-fun b_free!12957 () Bool)

(declare-fun b_next!12957 () Bool)

(assert (=> start!70670 (= b_free!12957 (not b_next!12957))))

(declare-fun tp!45609 () Bool)

(declare-fun b_and!21811 () Bool)

(assert (=> start!70670 (= tp!45609 b_and!21811)))

(declare-fun b!820929 () Bool)

(declare-fun res!560066 () Bool)

(declare-fun e!456153 () Bool)

(assert (=> b!820929 (=> (not res!560066) (not e!456153))))

(declare-datatypes ((array!45528 0))(
  ( (array!45529 (arr!21816 (Array (_ BitVec 32) (_ BitVec 64))) (size!22237 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45528)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45528 (_ BitVec 32)) Bool)

(assert (=> b!820929 (= res!560066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820930 () Bool)

(declare-fun e!456154 () Bool)

(declare-fun tp_is_empty!14667 () Bool)

(assert (=> b!820930 (= e!456154 tp_is_empty!14667)))

(declare-fun mapIsEmpty!23605 () Bool)

(declare-fun mapRes!23605 () Bool)

(assert (=> mapIsEmpty!23605 mapRes!23605))

(declare-fun res!560067 () Bool)

(assert (=> start!70670 (=> (not res!560067) (not e!456153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70670 (= res!560067 (validMask!0 mask!1312))))

(assert (=> start!70670 e!456153))

(assert (=> start!70670 tp_is_empty!14667))

(declare-fun array_inv!17437 (array!45528) Bool)

(assert (=> start!70670 (array_inv!17437 _keys!976)))

(assert (=> start!70670 true))

(declare-datatypes ((V!24557 0))(
  ( (V!24558 (val!7381 Int)) )
))
(declare-datatypes ((ValueCell!6918 0))(
  ( (ValueCellFull!6918 (v!9812 V!24557)) (EmptyCell!6918) )
))
(declare-datatypes ((array!45530 0))(
  ( (array!45531 (arr!21817 (Array (_ BitVec 32) ValueCell!6918)) (size!22238 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45530)

(declare-fun e!456156 () Bool)

(declare-fun array_inv!17438 (array!45530) Bool)

(assert (=> start!70670 (and (array_inv!17438 _values!788) e!456156)))

(assert (=> start!70670 tp!45609))

(declare-fun b!820931 () Bool)

(declare-fun res!560068 () Bool)

(assert (=> b!820931 (=> (not res!560068) (not e!456153))))

(declare-datatypes ((List!15551 0))(
  ( (Nil!15548) (Cons!15547 (h!16676 (_ BitVec 64)) (t!21884 List!15551)) )
))
(declare-fun arrayNoDuplicates!0 (array!45528 (_ BitVec 32) List!15551) Bool)

(assert (=> b!820931 (= res!560068 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15548))))

(declare-fun b!820932 () Bool)

(assert (=> b!820932 (= e!456153 (not true))))

(declare-datatypes ((tuple2!9732 0))(
  ( (tuple2!9733 (_1!4877 (_ BitVec 64)) (_2!4877 V!24557)) )
))
(declare-datatypes ((List!15552 0))(
  ( (Nil!15549) (Cons!15548 (h!16677 tuple2!9732) (t!21885 List!15552)) )
))
(declare-datatypes ((ListLongMap!8555 0))(
  ( (ListLongMap!8556 (toList!4293 List!15552)) )
))
(declare-fun lt!368975 () ListLongMap!8555)

(declare-fun lt!368976 () ListLongMap!8555)

(assert (=> b!820932 (= lt!368975 lt!368976)))

(declare-fun zeroValueBefore!34 () V!24557)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24557)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28063 0))(
  ( (Unit!28064) )
))
(declare-fun lt!368977 () Unit!28063)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24557)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!429 (array!45528 array!45530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24557 V!24557 V!24557 V!24557 (_ BitVec 32) Int) Unit!28063)

(assert (=> b!820932 (= lt!368977 (lemmaNoChangeToArrayThenSameMapNoExtras!429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2319 (array!45528 array!45530 (_ BitVec 32) (_ BitVec 32) V!24557 V!24557 (_ BitVec 32) Int) ListLongMap!8555)

(assert (=> b!820932 (= lt!368976 (getCurrentListMapNoExtraKeys!2319 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820932 (= lt!368975 (getCurrentListMapNoExtraKeys!2319 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820933 () Bool)

(declare-fun res!560065 () Bool)

(assert (=> b!820933 (=> (not res!560065) (not e!456153))))

(assert (=> b!820933 (= res!560065 (and (= (size!22238 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22237 _keys!976) (size!22238 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23605 () Bool)

(declare-fun tp!45610 () Bool)

(declare-fun e!456157 () Bool)

(assert (=> mapNonEmpty!23605 (= mapRes!23605 (and tp!45610 e!456157))))

(declare-fun mapRest!23605 () (Array (_ BitVec 32) ValueCell!6918))

(declare-fun mapKey!23605 () (_ BitVec 32))

(declare-fun mapValue!23605 () ValueCell!6918)

(assert (=> mapNonEmpty!23605 (= (arr!21817 _values!788) (store mapRest!23605 mapKey!23605 mapValue!23605))))

(declare-fun b!820934 () Bool)

(assert (=> b!820934 (= e!456156 (and e!456154 mapRes!23605))))

(declare-fun condMapEmpty!23605 () Bool)

(declare-fun mapDefault!23605 () ValueCell!6918)

(assert (=> b!820934 (= condMapEmpty!23605 (= (arr!21817 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6918)) mapDefault!23605)))))

(declare-fun b!820935 () Bool)

(assert (=> b!820935 (= e!456157 tp_is_empty!14667)))

(assert (= (and start!70670 res!560067) b!820933))

(assert (= (and b!820933 res!560065) b!820929))

(assert (= (and b!820929 res!560066) b!820931))

(assert (= (and b!820931 res!560068) b!820932))

(assert (= (and b!820934 condMapEmpty!23605) mapIsEmpty!23605))

(assert (= (and b!820934 (not condMapEmpty!23605)) mapNonEmpty!23605))

(get-info :version)

(assert (= (and mapNonEmpty!23605 ((_ is ValueCellFull!6918) mapValue!23605)) b!820935))

(assert (= (and b!820934 ((_ is ValueCellFull!6918) mapDefault!23605)) b!820930))

(assert (= start!70670 b!820934))

(declare-fun m!762813 () Bool)

(assert (=> b!820929 m!762813))

(declare-fun m!762815 () Bool)

(assert (=> b!820932 m!762815))

(declare-fun m!762817 () Bool)

(assert (=> b!820932 m!762817))

(declare-fun m!762819 () Bool)

(assert (=> b!820932 m!762819))

(declare-fun m!762821 () Bool)

(assert (=> mapNonEmpty!23605 m!762821))

(declare-fun m!762823 () Bool)

(assert (=> b!820931 m!762823))

(declare-fun m!762825 () Bool)

(assert (=> start!70670 m!762825))

(declare-fun m!762827 () Bool)

(assert (=> start!70670 m!762827))

(declare-fun m!762829 () Bool)

(assert (=> start!70670 m!762829))

(check-sat b_and!21811 (not b!820932) (not b_next!12957) (not b!820931) (not start!70670) tp_is_empty!14667 (not b!820929) (not mapNonEmpty!23605))
(check-sat b_and!21811 (not b_next!12957))
