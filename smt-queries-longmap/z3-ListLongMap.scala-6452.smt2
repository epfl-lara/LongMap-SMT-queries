; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82534 () Bool)

(assert start!82534)

(declare-fun b_free!18685 () Bool)

(declare-fun b_next!18685 () Bool)

(assert (=> start!82534 (= b_free!18685 (not b_next!18685))))

(declare-fun tp!65175 () Bool)

(declare-fun b_and!30147 () Bool)

(assert (=> start!82534 (= tp!65175 b_and!30147)))

(declare-fun b!961794 () Bool)

(declare-fun e!542376 () Bool)

(declare-fun e!542374 () Bool)

(declare-fun mapRes!34225 () Bool)

(assert (=> b!961794 (= e!542376 (and e!542374 mapRes!34225))))

(declare-fun condMapEmpty!34225 () Bool)

(declare-datatypes ((V!33633 0))(
  ( (V!33634 (val!10794 Int)) )
))
(declare-datatypes ((ValueCell!10262 0))(
  ( (ValueCellFull!10262 (v!13351 V!33633)) (EmptyCell!10262) )
))
(declare-datatypes ((array!59002 0))(
  ( (array!59003 (arr!28370 (Array (_ BitVec 32) ValueCell!10262)) (size!28851 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59002)

(declare-fun mapDefault!34225 () ValueCell!10262)

(assert (=> b!961794 (= condMapEmpty!34225 (= (arr!28370 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10262)) mapDefault!34225)))))

(declare-fun b!961795 () Bool)

(declare-fun tp_is_empty!21487 () Bool)

(assert (=> b!961795 (= e!542374 tp_is_empty!21487)))

(declare-fun b!961796 () Bool)

(declare-fun res!643708 () Bool)

(declare-fun e!542373 () Bool)

(assert (=> b!961796 (=> (not res!643708) (not e!542373))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59004 0))(
  ( (array!59005 (arr!28371 (Array (_ BitVec 32) (_ BitVec 64))) (size!28852 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59004)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961796 (= res!643708 (and (= (size!28851 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28852 _keys!1686) (size!28851 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961797 () Bool)

(declare-fun res!643705 () Bool)

(assert (=> b!961797 (=> (not res!643705) (not e!542373))))

(declare-datatypes ((List!19730 0))(
  ( (Nil!19727) (Cons!19726 (h!20888 (_ BitVec 64)) (t!28084 List!19730)) )
))
(declare-fun arrayNoDuplicates!0 (array!59004 (_ BitVec 32) List!19730) Bool)

(assert (=> b!961797 (= res!643705 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19727))))

(declare-fun b!961798 () Bool)

(assert (=> b!961798 (= e!542373 false)))

(declare-fun lt!430595 () Bool)

(declare-fun minValue!1342 () V!33633)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33633)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13922 0))(
  ( (tuple2!13923 (_1!6972 (_ BitVec 64)) (_2!6972 V!33633)) )
))
(declare-datatypes ((List!19731 0))(
  ( (Nil!19728) (Cons!19727 (h!20889 tuple2!13922) (t!28085 List!19731)) )
))
(declare-datatypes ((ListLongMap!12609 0))(
  ( (ListLongMap!12610 (toList!6320 List!19731)) )
))
(declare-fun contains!5367 (ListLongMap!12609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3482 (array!59004 array!59002 (_ BitVec 32) (_ BitVec 32) V!33633 V!33633 (_ BitVec 32) Int) ListLongMap!12609)

(assert (=> b!961798 (= lt!430595 (contains!5367 (getCurrentListMap!3482 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28371 _keys!1686) i!803)))))

(declare-fun b!961799 () Bool)

(declare-fun res!643709 () Bool)

(assert (=> b!961799 (=> (not res!643709) (not e!542373))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!961799 (= res!643709 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28852 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28852 _keys!1686))))))

(declare-fun b!961800 () Bool)

(declare-fun res!643704 () Bool)

(assert (=> b!961800 (=> (not res!643704) (not e!542373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59004 (_ BitVec 32)) Bool)

(assert (=> b!961800 (= res!643704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34225 () Bool)

(assert (=> mapIsEmpty!34225 mapRes!34225))

(declare-fun res!643707 () Bool)

(assert (=> start!82534 (=> (not res!643707) (not e!542373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82534 (= res!643707 (validMask!0 mask!2110))))

(assert (=> start!82534 e!542373))

(assert (=> start!82534 true))

(declare-fun array_inv!22041 (array!59002) Bool)

(assert (=> start!82534 (and (array_inv!22041 _values!1400) e!542376)))

(declare-fun array_inv!22042 (array!59004) Bool)

(assert (=> start!82534 (array_inv!22042 _keys!1686)))

(assert (=> start!82534 tp!65175))

(assert (=> start!82534 tp_is_empty!21487))

(declare-fun b!961801 () Bool)

(declare-fun res!643706 () Bool)

(assert (=> b!961801 (=> (not res!643706) (not e!542373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961801 (= res!643706 (validKeyInArray!0 (select (arr!28371 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34225 () Bool)

(declare-fun tp!65176 () Bool)

(declare-fun e!542377 () Bool)

(assert (=> mapNonEmpty!34225 (= mapRes!34225 (and tp!65176 e!542377))))

(declare-fun mapRest!34225 () (Array (_ BitVec 32) ValueCell!10262))

(declare-fun mapKey!34225 () (_ BitVec 32))

(declare-fun mapValue!34225 () ValueCell!10262)

(assert (=> mapNonEmpty!34225 (= (arr!28370 _values!1400) (store mapRest!34225 mapKey!34225 mapValue!34225))))

(declare-fun b!961802 () Bool)

(assert (=> b!961802 (= e!542377 tp_is_empty!21487)))

(assert (= (and start!82534 res!643707) b!961796))

(assert (= (and b!961796 res!643708) b!961800))

(assert (= (and b!961800 res!643704) b!961797))

(assert (= (and b!961797 res!643705) b!961799))

(assert (= (and b!961799 res!643709) b!961801))

(assert (= (and b!961801 res!643706) b!961798))

(assert (= (and b!961794 condMapEmpty!34225) mapIsEmpty!34225))

(assert (= (and b!961794 (not condMapEmpty!34225)) mapNonEmpty!34225))

(get-info :version)

(assert (= (and mapNonEmpty!34225 ((_ is ValueCellFull!10262) mapValue!34225)) b!961802))

(assert (= (and b!961794 ((_ is ValueCellFull!10262) mapDefault!34225)) b!961795))

(assert (= start!82534 b!961794))

(declare-fun m!891031 () Bool)

(assert (=> b!961800 m!891031))

(declare-fun m!891033 () Bool)

(assert (=> mapNonEmpty!34225 m!891033))

(declare-fun m!891035 () Bool)

(assert (=> b!961798 m!891035))

(declare-fun m!891037 () Bool)

(assert (=> b!961798 m!891037))

(assert (=> b!961798 m!891035))

(assert (=> b!961798 m!891037))

(declare-fun m!891039 () Bool)

(assert (=> b!961798 m!891039))

(declare-fun m!891041 () Bool)

(assert (=> b!961797 m!891041))

(declare-fun m!891043 () Bool)

(assert (=> start!82534 m!891043))

(declare-fun m!891045 () Bool)

(assert (=> start!82534 m!891045))

(declare-fun m!891047 () Bool)

(assert (=> start!82534 m!891047))

(assert (=> b!961801 m!891037))

(assert (=> b!961801 m!891037))

(declare-fun m!891049 () Bool)

(assert (=> b!961801 m!891049))

(check-sat (not b_next!18685) (not b!961801) tp_is_empty!21487 (not mapNonEmpty!34225) (not b!961800) (not b!961797) (not b!961798) b_and!30147 (not start!82534))
(check-sat b_and!30147 (not b_next!18685))
