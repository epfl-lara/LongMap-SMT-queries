; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82112 () Bool)

(assert start!82112)

(declare-fun mapIsEmpty!33436 () Bool)

(declare-fun mapRes!33436 () Bool)

(assert (=> mapIsEmpty!33436 mapRes!33436))

(declare-fun b!956782 () Bool)

(declare-fun res!640465 () Bool)

(declare-fun e!539064 () Bool)

(assert (=> b!956782 (=> (not res!640465) (not e!539064))))

(declare-datatypes ((array!58114 0))(
  ( (array!58115 (arr!27932 (Array (_ BitVec 32) (_ BitVec 64))) (size!28412 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58114)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58114 (_ BitVec 32)) Bool)

(assert (=> b!956782 (= res!640465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640464 () Bool)

(assert (=> start!82112 (=> (not res!640464) (not e!539064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82112 (= res!640464 (validMask!0 mask!1823))))

(assert (=> start!82112 e!539064))

(assert (=> start!82112 true))

(declare-datatypes ((V!32961 0))(
  ( (V!32962 (val!10542 Int)) )
))
(declare-datatypes ((ValueCell!10010 0))(
  ( (ValueCellFull!10010 (v!13094 V!32961)) (EmptyCell!10010) )
))
(declare-datatypes ((array!58116 0))(
  ( (array!58117 (arr!27933 (Array (_ BitVec 32) ValueCell!10010)) (size!28413 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58116)

(declare-fun e!539063 () Bool)

(declare-fun array_inv!21749 (array!58116) Bool)

(assert (=> start!82112 (and (array_inv!21749 _values!1197) e!539063)))

(declare-fun array_inv!21750 (array!58114) Bool)

(assert (=> start!82112 (array_inv!21750 _keys!1441)))

(declare-fun b!956783 () Bool)

(declare-fun e!539062 () Bool)

(assert (=> b!956783 (= e!539063 (and e!539062 mapRes!33436))))

(declare-fun condMapEmpty!33436 () Bool)

(declare-fun mapDefault!33436 () ValueCell!10010)

(assert (=> b!956783 (= condMapEmpty!33436 (= (arr!27933 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10010)) mapDefault!33436)))))

(declare-fun b!956784 () Bool)

(declare-fun tp_is_empty!20983 () Bool)

(assert (=> b!956784 (= e!539062 tp_is_empty!20983)))

(declare-fun b!956785 () Bool)

(assert (=> b!956785 (= e!539064 false)))

(declare-fun lt!430413 () Bool)

(declare-datatypes ((List!19457 0))(
  ( (Nil!19454) (Cons!19453 (h!20621 (_ BitVec 64)) (t!27810 List!19457)) )
))
(declare-fun arrayNoDuplicates!0 (array!58114 (_ BitVec 32) List!19457) Bool)

(assert (=> b!956785 (= lt!430413 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19454))))

(declare-fun b!956786 () Bool)

(declare-fun res!640466 () Bool)

(assert (=> b!956786 (=> (not res!640466) (not e!539064))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956786 (= res!640466 (and (= (size!28413 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28412 _keys!1441) (size!28413 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33436 () Bool)

(declare-fun tp!64015 () Bool)

(declare-fun e!539061 () Bool)

(assert (=> mapNonEmpty!33436 (= mapRes!33436 (and tp!64015 e!539061))))

(declare-fun mapValue!33436 () ValueCell!10010)

(declare-fun mapKey!33436 () (_ BitVec 32))

(declare-fun mapRest!33436 () (Array (_ BitVec 32) ValueCell!10010))

(assert (=> mapNonEmpty!33436 (= (arr!27933 _values!1197) (store mapRest!33436 mapKey!33436 mapValue!33436))))

(declare-fun b!956787 () Bool)

(assert (=> b!956787 (= e!539061 tp_is_empty!20983)))

(assert (= (and start!82112 res!640464) b!956786))

(assert (= (and b!956786 res!640466) b!956782))

(assert (= (and b!956782 res!640465) b!956785))

(assert (= (and b!956783 condMapEmpty!33436) mapIsEmpty!33436))

(assert (= (and b!956783 (not condMapEmpty!33436)) mapNonEmpty!33436))

(get-info :version)

(assert (= (and mapNonEmpty!33436 ((_ is ValueCellFull!10010) mapValue!33436)) b!956787))

(assert (= (and b!956783 ((_ is ValueCellFull!10010) mapDefault!33436)) b!956784))

(assert (= start!82112 b!956783))

(declare-fun m!888639 () Bool)

(assert (=> b!956782 m!888639))

(declare-fun m!888641 () Bool)

(assert (=> start!82112 m!888641))

(declare-fun m!888643 () Bool)

(assert (=> start!82112 m!888643))

(declare-fun m!888645 () Bool)

(assert (=> start!82112 m!888645))

(declare-fun m!888647 () Bool)

(assert (=> b!956785 m!888647))

(declare-fun m!888649 () Bool)

(assert (=> mapNonEmpty!33436 m!888649))

(check-sat (not b!956782) (not b!956785) tp_is_empty!20983 (not start!82112) (not mapNonEmpty!33436))
(check-sat)
