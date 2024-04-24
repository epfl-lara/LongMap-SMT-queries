; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82562 () Bool)

(assert start!82562)

(declare-fun b_free!18661 () Bool)

(declare-fun b_next!18661 () Bool)

(assert (=> start!82562 (= b_free!18661 (not b_next!18661))))

(declare-fun tp!64954 () Bool)

(declare-fun b_and!30159 () Bool)

(assert (=> start!82562 (= tp!64954 b_and!30159)))

(declare-fun b!961651 () Bool)

(declare-fun e!542154 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!961651 (= e!542154 (not (bvsge i!793 #b00000000000000000000000000000000)))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33481 0))(
  ( (V!33482 (val!10737 Int)) )
))
(declare-fun minValue!1328 () V!33481)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58866 0))(
  ( (array!58867 (arr!28302 (Array (_ BitVec 32) (_ BitVec 64))) (size!28782 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58866)

(declare-datatypes ((ValueCell!10205 0))(
  ( (ValueCellFull!10205 (v!13291 V!33481)) (EmptyCell!10205) )
))
(declare-datatypes ((array!58868 0))(
  ( (array!58869 (arr!28303 (Array (_ BitVec 32) ValueCell!10205)) (size!28783 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58868)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33481)

(declare-datatypes ((tuple2!13822 0))(
  ( (tuple2!13823 (_1!6922 (_ BitVec 64)) (_2!6922 V!33481)) )
))
(declare-datatypes ((List!19653 0))(
  ( (Nil!19650) (Cons!19649 (h!20817 tuple2!13822) (t!28008 List!19653)) )
))
(declare-datatypes ((ListLongMap!12521 0))(
  ( (ListLongMap!12522 (toList!6276 List!19653)) )
))
(declare-fun contains!5388 (ListLongMap!12521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3509 (array!58866 array!58868 (_ BitVec 32) (_ BitVec 32) V!33481 V!33481 (_ BitVec 32) Int) ListLongMap!12521)

(assert (=> b!961651 (contains!5388 (getCurrentListMap!3509 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28302 _keys!1668) i!793))))

(declare-datatypes ((Unit!32156 0))(
  ( (Unit!32157) )
))
(declare-fun lt!431044 () Unit!32156)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!16 (array!58866 array!58868 (_ BitVec 32) (_ BitVec 32) V!33481 V!33481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32156)

(assert (=> b!961651 (= lt!431044 (lemmaInListMapFromThenInFromSmaller!16 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!961652 () Bool)

(declare-fun res!643452 () Bool)

(assert (=> b!961652 (=> (not res!643452) (not e!542154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961652 (= res!643452 (validKeyInArray!0 (select (arr!28302 _keys!1668) i!793)))))

(declare-fun b!961653 () Bool)

(declare-fun res!643454 () Bool)

(assert (=> b!961653 (=> (not res!643454) (not e!542154))))

(declare-datatypes ((List!19654 0))(
  ( (Nil!19651) (Cons!19650 (h!20818 (_ BitVec 64)) (t!28009 List!19654)) )
))
(declare-fun arrayNoDuplicates!0 (array!58866 (_ BitVec 32) List!19654) Bool)

(assert (=> b!961653 (= res!643454 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19651))))

(declare-fun b!961654 () Bool)

(declare-fun e!542153 () Bool)

(declare-fun tp_is_empty!21373 () Bool)

(assert (=> b!961654 (= e!542153 tp_is_empty!21373)))

(declare-fun b!961655 () Bool)

(declare-fun res!643450 () Bool)

(assert (=> b!961655 (=> (not res!643450) (not e!542154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58866 (_ BitVec 32)) Bool)

(assert (=> b!961655 (= res!643450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!34039 () Bool)

(declare-fun mapRes!34039 () Bool)

(declare-fun tp!64953 () Bool)

(assert (=> mapNonEmpty!34039 (= mapRes!34039 (and tp!64953 e!542153))))

(declare-fun mapKey!34039 () (_ BitVec 32))

(declare-fun mapValue!34039 () ValueCell!10205)

(declare-fun mapRest!34039 () (Array (_ BitVec 32) ValueCell!10205))

(assert (=> mapNonEmpty!34039 (= (arr!28303 _values!1386) (store mapRest!34039 mapKey!34039 mapValue!34039))))

(declare-fun b!961656 () Bool)

(declare-fun e!542155 () Bool)

(assert (=> b!961656 (= e!542155 tp_is_empty!21373)))

(declare-fun res!643455 () Bool)

(assert (=> start!82562 (=> (not res!643455) (not e!542154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82562 (= res!643455 (validMask!0 mask!2088))))

(assert (=> start!82562 e!542154))

(assert (=> start!82562 true))

(assert (=> start!82562 tp_is_empty!21373))

(declare-fun array_inv!22017 (array!58866) Bool)

(assert (=> start!82562 (array_inv!22017 _keys!1668)))

(declare-fun e!542156 () Bool)

(declare-fun array_inv!22018 (array!58868) Bool)

(assert (=> start!82562 (and (array_inv!22018 _values!1386) e!542156)))

(assert (=> start!82562 tp!64954))

(declare-fun b!961657 () Bool)

(declare-fun res!643456 () Bool)

(assert (=> b!961657 (=> (not res!643456) (not e!542154))))

(assert (=> b!961657 (= res!643456 (and (= (size!28783 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28782 _keys!1668) (size!28783 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34039 () Bool)

(assert (=> mapIsEmpty!34039 mapRes!34039))

(declare-fun b!961658 () Bool)

(declare-fun res!643453 () Bool)

(assert (=> b!961658 (=> (not res!643453) (not e!542154))))

(assert (=> b!961658 (= res!643453 (contains!5388 (getCurrentListMap!3509 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28302 _keys!1668) i!793)))))

(declare-fun b!961659 () Bool)

(assert (=> b!961659 (= e!542156 (and e!542155 mapRes!34039))))

(declare-fun condMapEmpty!34039 () Bool)

(declare-fun mapDefault!34039 () ValueCell!10205)

(assert (=> b!961659 (= condMapEmpty!34039 (= (arr!28303 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10205)) mapDefault!34039)))))

(declare-fun b!961660 () Bool)

(declare-fun res!643451 () Bool)

(assert (=> b!961660 (=> (not res!643451) (not e!542154))))

(assert (=> b!961660 (= res!643451 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28782 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28782 _keys!1668))))))

(assert (= (and start!82562 res!643455) b!961657))

(assert (= (and b!961657 res!643456) b!961655))

(assert (= (and b!961655 res!643450) b!961653))

(assert (= (and b!961653 res!643454) b!961660))

(assert (= (and b!961660 res!643451) b!961652))

(assert (= (and b!961652 res!643452) b!961658))

(assert (= (and b!961658 res!643453) b!961651))

(assert (= (and b!961659 condMapEmpty!34039) mapIsEmpty!34039))

(assert (= (and b!961659 (not condMapEmpty!34039)) mapNonEmpty!34039))

(get-info :version)

(assert (= (and mapNonEmpty!34039 ((_ is ValueCellFull!10205) mapValue!34039)) b!961654))

(assert (= (and b!961659 ((_ is ValueCellFull!10205) mapDefault!34039)) b!961656))

(assert (= start!82562 b!961659))

(declare-fun m!892203 () Bool)

(assert (=> b!961652 m!892203))

(assert (=> b!961652 m!892203))

(declare-fun m!892205 () Bool)

(assert (=> b!961652 m!892205))

(declare-fun m!892207 () Bool)

(assert (=> b!961653 m!892207))

(declare-fun m!892209 () Bool)

(assert (=> b!961651 m!892209))

(assert (=> b!961651 m!892203))

(assert (=> b!961651 m!892209))

(assert (=> b!961651 m!892203))

(declare-fun m!892211 () Bool)

(assert (=> b!961651 m!892211))

(declare-fun m!892213 () Bool)

(assert (=> b!961651 m!892213))

(declare-fun m!892215 () Bool)

(assert (=> mapNonEmpty!34039 m!892215))

(declare-fun m!892217 () Bool)

(assert (=> b!961658 m!892217))

(assert (=> b!961658 m!892203))

(assert (=> b!961658 m!892217))

(assert (=> b!961658 m!892203))

(declare-fun m!892219 () Bool)

(assert (=> b!961658 m!892219))

(declare-fun m!892221 () Bool)

(assert (=> b!961655 m!892221))

(declare-fun m!892223 () Bool)

(assert (=> start!82562 m!892223))

(declare-fun m!892225 () Bool)

(assert (=> start!82562 m!892225))

(declare-fun m!892227 () Bool)

(assert (=> start!82562 m!892227))

(check-sat (not b_next!18661) (not b!961652) (not b!961653) tp_is_empty!21373 (not b!961651) (not start!82562) (not b!961655) (not b!961658) (not mapNonEmpty!34039) b_and!30159)
(check-sat b_and!30159 (not b_next!18661))
