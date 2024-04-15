; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82516 () Bool)

(assert start!82516)

(declare-fun b!961551 () Bool)

(declare-fun e!542240 () Bool)

(declare-fun tp_is_empty!21469 () Bool)

(assert (=> b!961551 (= e!542240 tp_is_empty!21469)))

(declare-fun b!961552 () Bool)

(declare-fun res!643544 () Bool)

(declare-fun e!542241 () Bool)

(assert (=> b!961552 (=> (not res!643544) (not e!542241))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33609 0))(
  ( (V!33610 (val!10785 Int)) )
))
(declare-datatypes ((ValueCell!10253 0))(
  ( (ValueCellFull!10253 (v!13342 V!33609)) (EmptyCell!10253) )
))
(declare-datatypes ((array!58968 0))(
  ( (array!58969 (arr!28353 (Array (_ BitVec 32) ValueCell!10253)) (size!28834 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58968)

(declare-datatypes ((array!58970 0))(
  ( (array!58971 (arr!28354 (Array (_ BitVec 32) (_ BitVec 64))) (size!28835 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58970)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961552 (= res!643544 (and (= (size!28834 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28835 _keys!1686) (size!28834 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961553 () Bool)

(declare-fun res!643542 () Bool)

(assert (=> b!961553 (=> (not res!643542) (not e!542241))))

(declare-datatypes ((List!19718 0))(
  ( (Nil!19715) (Cons!19714 (h!20876 (_ BitVec 64)) (t!28072 List!19718)) )
))
(declare-fun arrayNoDuplicates!0 (array!58970 (_ BitVec 32) List!19718) Bool)

(assert (=> b!961553 (= res!643542 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19715))))

(declare-fun mapNonEmpty!34198 () Bool)

(declare-fun mapRes!34198 () Bool)

(declare-fun tp!65128 () Bool)

(declare-fun e!542239 () Bool)

(assert (=> mapNonEmpty!34198 (= mapRes!34198 (and tp!65128 e!542239))))

(declare-fun mapKey!34198 () (_ BitVec 32))

(declare-fun mapRest!34198 () (Array (_ BitVec 32) ValueCell!10253))

(declare-fun mapValue!34198 () ValueCell!10253)

(assert (=> mapNonEmpty!34198 (= (arr!28353 _values!1400) (store mapRest!34198 mapKey!34198 mapValue!34198))))

(declare-fun b!961554 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!961554 (= e!542241 (bvsgt from!2084 (size!28835 _keys!1686)))))

(declare-fun b!961555 () Bool)

(declare-fun res!643545 () Bool)

(assert (=> b!961555 (=> (not res!643545) (not e!542241))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961555 (= res!643545 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28835 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28835 _keys!1686))))))

(declare-fun b!961556 () Bool)

(declare-fun res!643543 () Bool)

(assert (=> b!961556 (=> (not res!643543) (not e!542241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58970 (_ BitVec 32)) Bool)

(assert (=> b!961556 (= res!643543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34198 () Bool)

(assert (=> mapIsEmpty!34198 mapRes!34198))

(declare-fun b!961557 () Bool)

(declare-fun e!542242 () Bool)

(assert (=> b!961557 (= e!542242 (and e!542240 mapRes!34198))))

(declare-fun condMapEmpty!34198 () Bool)

(declare-fun mapDefault!34198 () ValueCell!10253)

(assert (=> b!961557 (= condMapEmpty!34198 (= (arr!28353 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10253)) mapDefault!34198)))))

(declare-fun res!643547 () Bool)

(assert (=> start!82516 (=> (not res!643547) (not e!542241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82516 (= res!643547 (validMask!0 mask!2110))))

(assert (=> start!82516 e!542241))

(assert (=> start!82516 true))

(declare-fun array_inv!22029 (array!58968) Bool)

(assert (=> start!82516 (and (array_inv!22029 _values!1400) e!542242)))

(declare-fun array_inv!22030 (array!58970) Bool)

(assert (=> start!82516 (array_inv!22030 _keys!1686)))

(declare-fun b!961558 () Bool)

(assert (=> b!961558 (= e!542239 tp_is_empty!21469)))

(declare-fun b!961559 () Bool)

(declare-fun res!643546 () Bool)

(assert (=> b!961559 (=> (not res!643546) (not e!542241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961559 (= res!643546 (validKeyInArray!0 (select (arr!28354 _keys!1686) i!803)))))

(assert (= (and start!82516 res!643547) b!961552))

(assert (= (and b!961552 res!643544) b!961556))

(assert (= (and b!961556 res!643543) b!961553))

(assert (= (and b!961553 res!643542) b!961555))

(assert (= (and b!961555 res!643545) b!961559))

(assert (= (and b!961559 res!643546) b!961554))

(assert (= (and b!961557 condMapEmpty!34198) mapIsEmpty!34198))

(assert (= (and b!961557 (not condMapEmpty!34198)) mapNonEmpty!34198))

(get-info :version)

(assert (= (and mapNonEmpty!34198 ((_ is ValueCellFull!10253) mapValue!34198)) b!961558))

(assert (= (and b!961557 ((_ is ValueCellFull!10253) mapDefault!34198)) b!961551))

(assert (= start!82516 b!961557))

(declare-fun m!890863 () Bool)

(assert (=> b!961553 m!890863))

(declare-fun m!890865 () Bool)

(assert (=> b!961559 m!890865))

(assert (=> b!961559 m!890865))

(declare-fun m!890867 () Bool)

(assert (=> b!961559 m!890867))

(declare-fun m!890869 () Bool)

(assert (=> b!961556 m!890869))

(declare-fun m!890871 () Bool)

(assert (=> start!82516 m!890871))

(declare-fun m!890873 () Bool)

(assert (=> start!82516 m!890873))

(declare-fun m!890875 () Bool)

(assert (=> start!82516 m!890875))

(declare-fun m!890877 () Bool)

(assert (=> mapNonEmpty!34198 m!890877))

(check-sat (not b!961556) (not b!961559) (not b!961553) (not mapNonEmpty!34198) (not start!82516) tp_is_empty!21469)
(check-sat)
