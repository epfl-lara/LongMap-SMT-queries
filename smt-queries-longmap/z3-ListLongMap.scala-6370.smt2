; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81958 () Bool)

(assert start!81958)

(declare-fun res!640183 () Bool)

(declare-fun e!538584 () Bool)

(assert (=> start!81958 (=> (not res!640183) (not e!538584))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81958 (= res!640183 (validMask!0 mask!1823))))

(assert (=> start!81958 e!538584))

(assert (=> start!81958 true))

(declare-datatypes ((V!32979 0))(
  ( (V!32980 (val!10549 Int)) )
))
(declare-datatypes ((ValueCell!10017 0))(
  ( (ValueCellFull!10017 (v!13104 V!32979)) (EmptyCell!10017) )
))
(declare-datatypes ((array!58093 0))(
  ( (array!58094 (arr!27926 (Array (_ BitVec 32) ValueCell!10017)) (size!28405 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58093)

(declare-fun e!538586 () Bool)

(declare-fun array_inv!21669 (array!58093) Bool)

(assert (=> start!81958 (and (array_inv!21669 _values!1197) e!538586)))

(declare-datatypes ((array!58095 0))(
  ( (array!58096 (arr!27927 (Array (_ BitVec 32) (_ BitVec 64))) (size!28406 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58095)

(declare-fun array_inv!21670 (array!58095) Bool)

(assert (=> start!81958 (array_inv!21670 _keys!1441)))

(declare-fun b!956005 () Bool)

(declare-fun e!538587 () Bool)

(declare-fun mapRes!33457 () Bool)

(assert (=> b!956005 (= e!538586 (and e!538587 mapRes!33457))))

(declare-fun condMapEmpty!33457 () Bool)

(declare-fun mapDefault!33457 () ValueCell!10017)

(assert (=> b!956005 (= condMapEmpty!33457 (= (arr!27926 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10017)) mapDefault!33457)))))

(declare-fun b!956006 () Bool)

(assert (=> b!956006 (= e!538584 false)))

(declare-fun lt!430073 () Bool)

(declare-datatypes ((List!19463 0))(
  ( (Nil!19460) (Cons!19459 (h!20621 (_ BitVec 64)) (t!27824 List!19463)) )
))
(declare-fun arrayNoDuplicates!0 (array!58095 (_ BitVec 32) List!19463) Bool)

(assert (=> b!956006 (= lt!430073 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19460))))

(declare-fun b!956007 () Bool)

(declare-fun res!640185 () Bool)

(assert (=> b!956007 (=> (not res!640185) (not e!538584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58095 (_ BitVec 32)) Bool)

(assert (=> b!956007 (= res!640185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956008 () Bool)

(declare-fun res!640184 () Bool)

(assert (=> b!956008 (=> (not res!640184) (not e!538584))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956008 (= res!640184 (and (= (size!28405 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28406 _keys!1441) (size!28405 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956009 () Bool)

(declare-fun tp_is_empty!20997 () Bool)

(assert (=> b!956009 (= e!538587 tp_is_empty!20997)))

(declare-fun mapNonEmpty!33457 () Bool)

(declare-fun tp!64035 () Bool)

(declare-fun e!538588 () Bool)

(assert (=> mapNonEmpty!33457 (= mapRes!33457 (and tp!64035 e!538588))))

(declare-fun mapRest!33457 () (Array (_ BitVec 32) ValueCell!10017))

(declare-fun mapValue!33457 () ValueCell!10017)

(declare-fun mapKey!33457 () (_ BitVec 32))

(assert (=> mapNonEmpty!33457 (= (arr!27926 _values!1197) (store mapRest!33457 mapKey!33457 mapValue!33457))))

(declare-fun b!956010 () Bool)

(assert (=> b!956010 (= e!538588 tp_is_empty!20997)))

(declare-fun mapIsEmpty!33457 () Bool)

(assert (=> mapIsEmpty!33457 mapRes!33457))

(assert (= (and start!81958 res!640183) b!956008))

(assert (= (and b!956008 res!640184) b!956007))

(assert (= (and b!956007 res!640185) b!956006))

(assert (= (and b!956005 condMapEmpty!33457) mapIsEmpty!33457))

(assert (= (and b!956005 (not condMapEmpty!33457)) mapNonEmpty!33457))

(get-info :version)

(assert (= (and mapNonEmpty!33457 ((_ is ValueCellFull!10017) mapValue!33457)) b!956010))

(assert (= (and b!956005 ((_ is ValueCellFull!10017) mapDefault!33457)) b!956009))

(assert (= start!81958 b!956005))

(declare-fun m!887429 () Bool)

(assert (=> start!81958 m!887429))

(declare-fun m!887431 () Bool)

(assert (=> start!81958 m!887431))

(declare-fun m!887433 () Bool)

(assert (=> start!81958 m!887433))

(declare-fun m!887435 () Bool)

(assert (=> b!956006 m!887435))

(declare-fun m!887437 () Bool)

(assert (=> b!956007 m!887437))

(declare-fun m!887439 () Bool)

(assert (=> mapNonEmpty!33457 m!887439))

(check-sat (not mapNonEmpty!33457) (not start!81958) (not b!956006) tp_is_empty!20997 (not b!956007))
(check-sat)
