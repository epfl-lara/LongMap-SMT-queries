; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81946 () Bool)

(assert start!81946)

(declare-fun mapNonEmpty!33439 () Bool)

(declare-fun mapRes!33439 () Bool)

(declare-fun tp!64017 () Bool)

(declare-fun e!538497 () Bool)

(assert (=> mapNonEmpty!33439 (= mapRes!33439 (and tp!64017 e!538497))))

(declare-fun mapKey!33439 () (_ BitVec 32))

(declare-datatypes ((V!32963 0))(
  ( (V!32964 (val!10543 Int)) )
))
(declare-datatypes ((ValueCell!10011 0))(
  ( (ValueCellFull!10011 (v!13098 V!32963)) (EmptyCell!10011) )
))
(declare-fun mapValue!33439 () ValueCell!10011)

(declare-datatypes ((array!58071 0))(
  ( (array!58072 (arr!27915 (Array (_ BitVec 32) ValueCell!10011)) (size!28394 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58071)

(declare-fun mapRest!33439 () (Array (_ BitVec 32) ValueCell!10011))

(assert (=> mapNonEmpty!33439 (= (arr!27915 _values!1197) (store mapRest!33439 mapKey!33439 mapValue!33439))))

(declare-fun b!955897 () Bool)

(declare-fun res!640130 () Bool)

(declare-fun e!538496 () Bool)

(assert (=> b!955897 (=> (not res!640130) (not e!538496))))

(declare-datatypes ((array!58073 0))(
  ( (array!58074 (arr!27916 (Array (_ BitVec 32) (_ BitVec 64))) (size!28395 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58073)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955897 (= res!640130 (and (= (size!28394 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28395 _keys!1441) (size!28394 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955898 () Bool)

(declare-fun res!640131 () Bool)

(assert (=> b!955898 (=> (not res!640131) (not e!538496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58073 (_ BitVec 32)) Bool)

(assert (=> b!955898 (= res!640131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955899 () Bool)

(declare-fun e!538495 () Bool)

(declare-fun e!538494 () Bool)

(assert (=> b!955899 (= e!538495 (and e!538494 mapRes!33439))))

(declare-fun condMapEmpty!33439 () Bool)

(declare-fun mapDefault!33439 () ValueCell!10011)

(assert (=> b!955899 (= condMapEmpty!33439 (= (arr!27915 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10011)) mapDefault!33439)))))

(declare-fun b!955900 () Bool)

(assert (=> b!955900 (= e!538496 false)))

(declare-fun lt!430055 () Bool)

(declare-datatypes ((List!19459 0))(
  ( (Nil!19456) (Cons!19455 (h!20617 (_ BitVec 64)) (t!27820 List!19459)) )
))
(declare-fun arrayNoDuplicates!0 (array!58073 (_ BitVec 32) List!19459) Bool)

(assert (=> b!955900 (= lt!430055 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19456))))

(declare-fun b!955901 () Bool)

(declare-fun tp_is_empty!20985 () Bool)

(assert (=> b!955901 (= e!538494 tp_is_empty!20985)))

(declare-fun res!640129 () Bool)

(assert (=> start!81946 (=> (not res!640129) (not e!538496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81946 (= res!640129 (validMask!0 mask!1823))))

(assert (=> start!81946 e!538496))

(assert (=> start!81946 true))

(declare-fun array_inv!21661 (array!58071) Bool)

(assert (=> start!81946 (and (array_inv!21661 _values!1197) e!538495)))

(declare-fun array_inv!21662 (array!58073) Bool)

(assert (=> start!81946 (array_inv!21662 _keys!1441)))

(declare-fun mapIsEmpty!33439 () Bool)

(assert (=> mapIsEmpty!33439 mapRes!33439))

(declare-fun b!955902 () Bool)

(assert (=> b!955902 (= e!538497 tp_is_empty!20985)))

(assert (= (and start!81946 res!640129) b!955897))

(assert (= (and b!955897 res!640130) b!955898))

(assert (= (and b!955898 res!640131) b!955900))

(assert (= (and b!955899 condMapEmpty!33439) mapIsEmpty!33439))

(assert (= (and b!955899 (not condMapEmpty!33439)) mapNonEmpty!33439))

(get-info :version)

(assert (= (and mapNonEmpty!33439 ((_ is ValueCellFull!10011) mapValue!33439)) b!955902))

(assert (= (and b!955899 ((_ is ValueCellFull!10011) mapDefault!33439)) b!955901))

(assert (= start!81946 b!955899))

(declare-fun m!887357 () Bool)

(assert (=> mapNonEmpty!33439 m!887357))

(declare-fun m!887359 () Bool)

(assert (=> b!955898 m!887359))

(declare-fun m!887361 () Bool)

(assert (=> b!955900 m!887361))

(declare-fun m!887363 () Bool)

(assert (=> start!81946 m!887363))

(declare-fun m!887365 () Bool)

(assert (=> start!81946 m!887365))

(declare-fun m!887367 () Bool)

(assert (=> start!81946 m!887367))

(check-sat tp_is_empty!20985 (not b!955900) (not mapNonEmpty!33439) (not b!955898) (not start!81946))
(check-sat)
