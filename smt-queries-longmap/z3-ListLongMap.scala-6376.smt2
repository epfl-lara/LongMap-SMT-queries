; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81974 () Bool)

(assert start!81974)

(declare-fun b!956072 () Bool)

(declare-fun e!538694 () Bool)

(declare-fun tp_is_empty!21031 () Bool)

(assert (=> b!956072 (= e!538694 tp_is_empty!21031)))

(declare-fun b!956073 () Bool)

(declare-fun res!640228 () Bool)

(declare-fun e!538691 () Bool)

(assert (=> b!956073 (=> (not res!640228) (not e!538691))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33025 0))(
  ( (V!33026 (val!10566 Int)) )
))
(declare-datatypes ((ValueCell!10034 0))(
  ( (ValueCellFull!10034 (v!13120 V!33025)) (EmptyCell!10034) )
))
(declare-datatypes ((array!58106 0))(
  ( (array!58107 (arr!27933 (Array (_ BitVec 32) ValueCell!10034)) (size!28414 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58106)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!58108 0))(
  ( (array!58109 (arr!27934 (Array (_ BitVec 32) (_ BitVec 64))) (size!28415 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58108)

(assert (=> b!956073 (= res!640228 (and (= (size!28414 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28415 _keys!1441) (size!28414 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956074 () Bool)

(declare-fun res!640226 () Bool)

(assert (=> b!956074 (=> (not res!640226) (not e!538691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58108 (_ BitVec 32)) Bool)

(assert (=> b!956074 (= res!640226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956075 () Bool)

(declare-fun e!538692 () Bool)

(assert (=> b!956075 (= e!538692 tp_is_empty!21031)))

(declare-fun b!956076 () Bool)

(declare-fun e!538693 () Bool)

(declare-fun mapRes!33508 () Bool)

(assert (=> b!956076 (= e!538693 (and e!538694 mapRes!33508))))

(declare-fun condMapEmpty!33508 () Bool)

(declare-fun mapDefault!33508 () ValueCell!10034)

(assert (=> b!956076 (= condMapEmpty!33508 (= (arr!27933 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10034)) mapDefault!33508)))))

(declare-fun mapNonEmpty!33508 () Bool)

(declare-fun tp!64087 () Bool)

(assert (=> mapNonEmpty!33508 (= mapRes!33508 (and tp!64087 e!538692))))

(declare-fun mapRest!33508 () (Array (_ BitVec 32) ValueCell!10034))

(declare-fun mapValue!33508 () ValueCell!10034)

(declare-fun mapKey!33508 () (_ BitVec 32))

(assert (=> mapNonEmpty!33508 (= (arr!27933 _values!1197) (store mapRest!33508 mapKey!33508 mapValue!33508))))

(declare-fun mapIsEmpty!33508 () Bool)

(assert (=> mapIsEmpty!33508 mapRes!33508))

(declare-fun res!640227 () Bool)

(assert (=> start!81974 (=> (not res!640227) (not e!538691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81974 (= res!640227 (validMask!0 mask!1823))))

(assert (=> start!81974 e!538691))

(assert (=> start!81974 true))

(declare-fun array_inv!21737 (array!58106) Bool)

(assert (=> start!81974 (and (array_inv!21737 _values!1197) e!538693)))

(declare-fun array_inv!21738 (array!58108) Bool)

(assert (=> start!81974 (array_inv!21738 _keys!1441)))

(declare-fun b!956077 () Bool)

(assert (=> b!956077 (= e!538691 false)))

(declare-fun lt!429888 () Bool)

(declare-datatypes ((List!19487 0))(
  ( (Nil!19484) (Cons!19483 (h!20645 (_ BitVec 64)) (t!27839 List!19487)) )
))
(declare-fun arrayNoDuplicates!0 (array!58108 (_ BitVec 32) List!19487) Bool)

(assert (=> b!956077 (= lt!429888 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19484))))

(assert (= (and start!81974 res!640227) b!956073))

(assert (= (and b!956073 res!640228) b!956074))

(assert (= (and b!956074 res!640226) b!956077))

(assert (= (and b!956076 condMapEmpty!33508) mapIsEmpty!33508))

(assert (= (and b!956076 (not condMapEmpty!33508)) mapNonEmpty!33508))

(get-info :version)

(assert (= (and mapNonEmpty!33508 ((_ is ValueCellFull!10034) mapValue!33508)) b!956075))

(assert (= (and b!956076 ((_ is ValueCellFull!10034) mapDefault!33508)) b!956072))

(assert (= start!81974 b!956076))

(declare-fun m!886875 () Bool)

(assert (=> b!956074 m!886875))

(declare-fun m!886877 () Bool)

(assert (=> mapNonEmpty!33508 m!886877))

(declare-fun m!886879 () Bool)

(assert (=> start!81974 m!886879))

(declare-fun m!886881 () Bool)

(assert (=> start!81974 m!886881))

(declare-fun m!886883 () Bool)

(assert (=> start!81974 m!886883))

(declare-fun m!886885 () Bool)

(assert (=> b!956077 m!886885))

(check-sat (not b!956077) (not start!81974) (not b!956074) (not mapNonEmpty!33508) tp_is_empty!21031)
(check-sat)
