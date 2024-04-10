; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82536 () Bool)

(assert start!82536)

(declare-fun b!961817 () Bool)

(declare-fun e!542401 () Bool)

(declare-fun tp_is_empty!21471 () Bool)

(assert (=> b!961817 (= e!542401 tp_is_empty!21471)))

(declare-fun b!961818 () Bool)

(declare-fun res!643670 () Bool)

(declare-fun e!542402 () Bool)

(assert (=> b!961818 (=> (not res!643670) (not e!542402))))

(declare-datatypes ((array!59039 0))(
  ( (array!59040 (arr!28388 (Array (_ BitVec 32) (_ BitVec 64))) (size!28867 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59039)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961818 (= res!643670 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28867 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28867 _keys!1686))))))

(declare-fun mapIsEmpty!34201 () Bool)

(declare-fun mapRes!34201 () Bool)

(assert (=> mapIsEmpty!34201 mapRes!34201))

(declare-fun b!961819 () Bool)

(declare-fun res!643671 () Bool)

(assert (=> b!961819 (=> (not res!643671) (not e!542402))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33611 0))(
  ( (V!33612 (val!10786 Int)) )
))
(declare-datatypes ((ValueCell!10254 0))(
  ( (ValueCellFull!10254 (v!13344 V!33611)) (EmptyCell!10254) )
))
(declare-datatypes ((array!59041 0))(
  ( (array!59042 (arr!28389 (Array (_ BitVec 32) ValueCell!10254)) (size!28868 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59041)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961819 (= res!643671 (and (= (size!28868 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28867 _keys!1686) (size!28868 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961820 () Bool)

(declare-fun res!643675 () Bool)

(assert (=> b!961820 (=> (not res!643675) (not e!542402))))

(declare-datatypes ((List!19704 0))(
  ( (Nil!19701) (Cons!19700 (h!20862 (_ BitVec 64)) (t!28067 List!19704)) )
))
(declare-fun arrayNoDuplicates!0 (array!59039 (_ BitVec 32) List!19704) Bool)

(assert (=> b!961820 (= res!643675 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19701))))

(declare-fun b!961821 () Bool)

(declare-fun e!542403 () Bool)

(assert (=> b!961821 (= e!542403 tp_is_empty!21471)))

(declare-fun b!961822 () Bool)

(declare-fun e!542404 () Bool)

(assert (=> b!961822 (= e!542404 (and e!542401 mapRes!34201))))

(declare-fun condMapEmpty!34201 () Bool)

(declare-fun mapDefault!34201 () ValueCell!10254)

(assert (=> b!961822 (= condMapEmpty!34201 (= (arr!28389 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10254)) mapDefault!34201)))))

(declare-fun mapNonEmpty!34201 () Bool)

(declare-fun tp!65130 () Bool)

(assert (=> mapNonEmpty!34201 (= mapRes!34201 (and tp!65130 e!542403))))

(declare-fun mapKey!34201 () (_ BitVec 32))

(declare-fun mapValue!34201 () ValueCell!10254)

(declare-fun mapRest!34201 () (Array (_ BitVec 32) ValueCell!10254))

(assert (=> mapNonEmpty!34201 (= (arr!28389 _values!1400) (store mapRest!34201 mapKey!34201 mapValue!34201))))

(declare-fun b!961824 () Bool)

(declare-fun res!643674 () Bool)

(assert (=> b!961824 (=> (not res!643674) (not e!542402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59039 (_ BitVec 32)) Bool)

(assert (=> b!961824 (= res!643674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961825 () Bool)

(assert (=> b!961825 (= e!542402 (bvsgt from!2084 (size!28867 _keys!1686)))))

(declare-fun res!643673 () Bool)

(assert (=> start!82536 (=> (not res!643673) (not e!542402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82536 (= res!643673 (validMask!0 mask!2110))))

(assert (=> start!82536 e!542402))

(assert (=> start!82536 true))

(declare-fun array_inv!21997 (array!59041) Bool)

(assert (=> start!82536 (and (array_inv!21997 _values!1400) e!542404)))

(declare-fun array_inv!21998 (array!59039) Bool)

(assert (=> start!82536 (array_inv!21998 _keys!1686)))

(declare-fun b!961823 () Bool)

(declare-fun res!643672 () Bool)

(assert (=> b!961823 (=> (not res!643672) (not e!542402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961823 (= res!643672 (validKeyInArray!0 (select (arr!28388 _keys!1686) i!803)))))

(assert (= (and start!82536 res!643673) b!961819))

(assert (= (and b!961819 res!643671) b!961824))

(assert (= (and b!961824 res!643674) b!961820))

(assert (= (and b!961820 res!643675) b!961818))

(assert (= (and b!961818 res!643670) b!961823))

(assert (= (and b!961823 res!643672) b!961825))

(assert (= (and b!961822 condMapEmpty!34201) mapIsEmpty!34201))

(assert (= (and b!961822 (not condMapEmpty!34201)) mapNonEmpty!34201))

(get-info :version)

(assert (= (and mapNonEmpty!34201 ((_ is ValueCellFull!10254) mapValue!34201)) b!961821))

(assert (= (and b!961822 ((_ is ValueCellFull!10254) mapDefault!34201)) b!961817))

(assert (= start!82536 b!961822))

(declare-fun m!891637 () Bool)

(assert (=> mapNonEmpty!34201 m!891637))

(declare-fun m!891639 () Bool)

(assert (=> b!961824 m!891639))

(declare-fun m!891641 () Bool)

(assert (=> b!961820 m!891641))

(declare-fun m!891643 () Bool)

(assert (=> start!82536 m!891643))

(declare-fun m!891645 () Bool)

(assert (=> start!82536 m!891645))

(declare-fun m!891647 () Bool)

(assert (=> start!82536 m!891647))

(declare-fun m!891649 () Bool)

(assert (=> b!961823 m!891649))

(assert (=> b!961823 m!891649))

(declare-fun m!891651 () Bool)

(assert (=> b!961823 m!891651))

(check-sat (not mapNonEmpty!34201) (not b!961824) (not b!961820) tp_is_empty!21471 (not b!961823) (not start!82536))
(check-sat)
