; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82312 () Bool)

(assert start!82312)

(declare-fun b!959647 () Bool)

(declare-fun e!540960 () Bool)

(declare-fun tp_is_empty!21291 () Bool)

(assert (=> b!959647 (= e!540960 tp_is_empty!21291)))

(declare-fun b!959648 () Bool)

(declare-fun res!642376 () Bool)

(declare-fun e!540958 () Bool)

(assert (=> b!959648 (=> (not res!642376) (not e!540958))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58673 0))(
  ( (array!58674 (arr!28210 (Array (_ BitVec 32) (_ BitVec 64))) (size!28689 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58673)

(declare-datatypes ((V!33371 0))(
  ( (V!33372 (val!10696 Int)) )
))
(declare-datatypes ((ValueCell!10164 0))(
  ( (ValueCellFull!10164 (v!13253 V!33371)) (EmptyCell!10164) )
))
(declare-datatypes ((array!58675 0))(
  ( (array!58676 (arr!28211 (Array (_ BitVec 32) ValueCell!10164)) (size!28690 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58675)

(assert (=> b!959648 (= res!642376 (and (= (size!28690 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28689 _keys!1668) (size!28690 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959649 () Bool)

(declare-fun res!642377 () Bool)

(assert (=> b!959649 (=> (not res!642377) (not e!540958))))

(declare-datatypes ((List!19616 0))(
  ( (Nil!19613) (Cons!19612 (h!20774 (_ BitVec 64)) (t!27979 List!19616)) )
))
(declare-fun arrayNoDuplicates!0 (array!58673 (_ BitVec 32) List!19616) Bool)

(assert (=> b!959649 (= res!642377 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19613))))

(declare-fun res!642375 () Bool)

(assert (=> start!82312 (=> (not res!642375) (not e!540958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82312 (= res!642375 (validMask!0 mask!2088))))

(assert (=> start!82312 e!540958))

(assert (=> start!82312 true))

(declare-fun array_inv!21865 (array!58673) Bool)

(assert (=> start!82312 (array_inv!21865 _keys!1668)))

(declare-fun e!540957 () Bool)

(declare-fun array_inv!21866 (array!58675) Bool)

(assert (=> start!82312 (and (array_inv!21866 _values!1386) e!540957)))

(declare-fun b!959650 () Bool)

(declare-fun e!540959 () Bool)

(assert (=> b!959650 (= e!540959 tp_is_empty!21291)))

(declare-fun mapNonEmpty!33916 () Bool)

(declare-fun mapRes!33916 () Bool)

(declare-fun tp!64710 () Bool)

(assert (=> mapNonEmpty!33916 (= mapRes!33916 (and tp!64710 e!540960))))

(declare-fun mapValue!33916 () ValueCell!10164)

(declare-fun mapRest!33916 () (Array (_ BitVec 32) ValueCell!10164))

(declare-fun mapKey!33916 () (_ BitVec 32))

(assert (=> mapNonEmpty!33916 (= (arr!28211 _values!1386) (store mapRest!33916 mapKey!33916 mapValue!33916))))

(declare-fun b!959651 () Bool)

(declare-fun res!642374 () Bool)

(assert (=> b!959651 (=> (not res!642374) (not e!540958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58673 (_ BitVec 32)) Bool)

(assert (=> b!959651 (= res!642374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959652 () Bool)

(assert (=> b!959652 (= e!540957 (and e!540959 mapRes!33916))))

(declare-fun condMapEmpty!33916 () Bool)

(declare-fun mapDefault!33916 () ValueCell!10164)

(assert (=> b!959652 (= condMapEmpty!33916 (= (arr!28211 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10164)) mapDefault!33916)))))

(declare-fun mapIsEmpty!33916 () Bool)

(assert (=> mapIsEmpty!33916 mapRes!33916))

(declare-fun b!959653 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959653 (= e!540958 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28689 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28689 _keys!1668)) (bvslt i!793 #b00000000000000000000000000000000)))))

(assert (= (and start!82312 res!642375) b!959648))

(assert (= (and b!959648 res!642376) b!959651))

(assert (= (and b!959651 res!642374) b!959649))

(assert (= (and b!959649 res!642377) b!959653))

(assert (= (and b!959652 condMapEmpty!33916) mapIsEmpty!33916))

(assert (= (and b!959652 (not condMapEmpty!33916)) mapNonEmpty!33916))

(get-info :version)

(assert (= (and mapNonEmpty!33916 ((_ is ValueCellFull!10164) mapValue!33916)) b!959647))

(assert (= (and b!959652 ((_ is ValueCellFull!10164) mapDefault!33916)) b!959650))

(assert (= start!82312 b!959652))

(declare-fun m!890111 () Bool)

(assert (=> b!959649 m!890111))

(declare-fun m!890113 () Bool)

(assert (=> start!82312 m!890113))

(declare-fun m!890115 () Bool)

(assert (=> start!82312 m!890115))

(declare-fun m!890117 () Bool)

(assert (=> start!82312 m!890117))

(declare-fun m!890119 () Bool)

(assert (=> mapNonEmpty!33916 m!890119))

(declare-fun m!890121 () Bool)

(assert (=> b!959651 m!890121))

(check-sat (not start!82312) (not b!959649) (not b!959651) (not mapNonEmpty!33916) tp_is_empty!21291)
(check-sat)
