; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41214 () Bool)

(assert start!41214)

(declare-fun b_free!11071 () Bool)

(declare-fun b_next!11071 () Bool)

(assert (=> start!41214 (= b_free!11071 (not b_next!11071))))

(declare-fun tp!39052 () Bool)

(declare-fun b_and!19365 () Bool)

(assert (=> start!41214 (= tp!39052 b_and!19365)))

(declare-fun mapIsEmpty!20266 () Bool)

(declare-fun mapRes!20266 () Bool)

(assert (=> mapIsEmpty!20266 mapRes!20266))

(declare-fun b!460823 () Bool)

(declare-fun res!275608 () Bool)

(declare-fun e!268787 () Bool)

(assert (=> b!460823 (=> (not res!275608) (not e!268787))))

(declare-datatypes ((array!28615 0))(
  ( (array!28616 (arr!13747 (Array (_ BitVec 32) (_ BitVec 64))) (size!14100 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28615)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460823 (= res!275608 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460824 () Bool)

(declare-fun res!275612 () Bool)

(assert (=> b!460824 (=> (not res!275612) (not e!268787))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17651 0))(
  ( (V!17652 (val!6249 Int)) )
))
(declare-datatypes ((ValueCell!5861 0))(
  ( (ValueCellFull!5861 (v!8525 V!17651)) (EmptyCell!5861) )
))
(declare-datatypes ((array!28617 0))(
  ( (array!28618 (arr!13748 (Array (_ BitVec 32) ValueCell!5861)) (size!14101 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28617)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!460824 (= res!275612 (and (= (size!14101 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14100 _keys!709) (size!14101 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460825 () Bool)

(declare-fun e!268790 () Bool)

(declare-fun e!268788 () Bool)

(assert (=> b!460825 (= e!268790 (not e!268788))))

(declare-fun res!275605 () Bool)

(assert (=> b!460825 (=> res!275605 e!268788)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460825 (= res!275605 (validKeyInArray!0 (select (arr!13747 _keys!709) from!863)))))

(declare-fun lt!208651 () array!28617)

(declare-fun minValue!515 () V!17651)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!208649 () array!28615)

(declare-fun zeroValue!515 () V!17651)

(declare-fun v!412 () V!17651)

(declare-datatypes ((tuple2!8274 0))(
  ( (tuple2!8275 (_1!4148 (_ BitVec 64)) (_2!4148 V!17651)) )
))
(declare-datatypes ((List!8336 0))(
  ( (Nil!8333) (Cons!8332 (h!9188 tuple2!8274) (t!14269 List!8336)) )
))
(declare-datatypes ((ListLongMap!7177 0))(
  ( (ListLongMap!7178 (toList!3604 List!8336)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1796 (array!28615 array!28617 (_ BitVec 32) (_ BitVec 32) V!17651 V!17651 (_ BitVec 32) Int) ListLongMap!7177)

(declare-fun +!1656 (ListLongMap!7177 tuple2!8274) ListLongMap!7177)

(assert (=> b!460825 (= (getCurrentListMapNoExtraKeys!1796 lt!208649 lt!208651 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1656 (getCurrentListMapNoExtraKeys!1796 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8275 k0!794 v!412)))))

(declare-datatypes ((Unit!13392 0))(
  ( (Unit!13393) )
))
(declare-fun lt!208652 () Unit!13392)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!786 (array!28615 array!28617 (_ BitVec 32) (_ BitVec 32) V!17651 V!17651 (_ BitVec 32) (_ BitVec 64) V!17651 (_ BitVec 32) Int) Unit!13392)

(assert (=> b!460825 (= lt!208652 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!786 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460826 () Bool)

(declare-fun e!268786 () Bool)

(assert (=> b!460826 (= e!268786 e!268790)))

(declare-fun res!275606 () Bool)

(assert (=> b!460826 (=> (not res!275606) (not e!268790))))

(assert (=> b!460826 (= res!275606 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208650 () ListLongMap!7177)

(assert (=> b!460826 (= lt!208650 (getCurrentListMapNoExtraKeys!1796 lt!208649 lt!208651 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460826 (= lt!208651 (array!28618 (store (arr!13748 _values!549) i!563 (ValueCellFull!5861 v!412)) (size!14101 _values!549)))))

(declare-fun lt!208653 () ListLongMap!7177)

(assert (=> b!460826 (= lt!208653 (getCurrentListMapNoExtraKeys!1796 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460827 () Bool)

(assert (=> b!460827 (= e!268788 (bvslt i!563 (size!14101 _values!549)))))

(declare-fun b!460828 () Bool)

(declare-fun res!275613 () Bool)

(assert (=> b!460828 (=> (not res!275613) (not e!268787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460828 (= res!275613 (validMask!0 mask!1025))))

(declare-fun b!460829 () Bool)

(declare-fun res!275610 () Bool)

(assert (=> b!460829 (=> (not res!275610) (not e!268786))))

(declare-datatypes ((List!8337 0))(
  ( (Nil!8334) (Cons!8333 (h!9189 (_ BitVec 64)) (t!14270 List!8337)) )
))
(declare-fun arrayNoDuplicates!0 (array!28615 (_ BitVec 32) List!8337) Bool)

(assert (=> b!460829 (= res!275610 (arrayNoDuplicates!0 lt!208649 #b00000000000000000000000000000000 Nil!8334))))

(declare-fun b!460830 () Bool)

(declare-fun e!268789 () Bool)

(declare-fun tp_is_empty!12409 () Bool)

(assert (=> b!460830 (= e!268789 tp_is_empty!12409)))

(declare-fun b!460831 () Bool)

(declare-fun res!275614 () Bool)

(assert (=> b!460831 (=> (not res!275614) (not e!268787))))

(assert (=> b!460831 (= res!275614 (or (= (select (arr!13747 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13747 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460832 () Bool)

(declare-fun res!275611 () Bool)

(assert (=> b!460832 (=> (not res!275611) (not e!268787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28615 (_ BitVec 32)) Bool)

(assert (=> b!460832 (= res!275611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460833 () Bool)

(declare-fun res!275609 () Bool)

(assert (=> b!460833 (=> (not res!275609) (not e!268787))))

(assert (=> b!460833 (= res!275609 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8334))))

(declare-fun res!275607 () Bool)

(assert (=> start!41214 (=> (not res!275607) (not e!268787))))

(assert (=> start!41214 (= res!275607 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14100 _keys!709))))))

(assert (=> start!41214 e!268787))

(assert (=> start!41214 tp_is_empty!12409))

(assert (=> start!41214 tp!39052))

(assert (=> start!41214 true))

(declare-fun e!268784 () Bool)

(declare-fun array_inv!10008 (array!28617) Bool)

(assert (=> start!41214 (and (array_inv!10008 _values!549) e!268784)))

(declare-fun array_inv!10009 (array!28615) Bool)

(assert (=> start!41214 (array_inv!10009 _keys!709)))

(declare-fun b!460834 () Bool)

(declare-fun res!275618 () Bool)

(assert (=> b!460834 (=> (not res!275618) (not e!268786))))

(assert (=> b!460834 (= res!275618 (bvsle from!863 i!563))))

(declare-fun b!460835 () Bool)

(declare-fun res!275616 () Bool)

(assert (=> b!460835 (=> (not res!275616) (not e!268787))))

(assert (=> b!460835 (= res!275616 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14100 _keys!709))))))

(declare-fun b!460836 () Bool)

(declare-fun res!275615 () Bool)

(assert (=> b!460836 (=> (not res!275615) (not e!268787))))

(assert (=> b!460836 (= res!275615 (validKeyInArray!0 k0!794))))

(declare-fun b!460837 () Bool)

(declare-fun e!268785 () Bool)

(assert (=> b!460837 (= e!268784 (and e!268785 mapRes!20266))))

(declare-fun condMapEmpty!20266 () Bool)

(declare-fun mapDefault!20266 () ValueCell!5861)

(assert (=> b!460837 (= condMapEmpty!20266 (= (arr!13748 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5861)) mapDefault!20266)))))

(declare-fun b!460838 () Bool)

(assert (=> b!460838 (= e!268787 e!268786)))

(declare-fun res!275617 () Bool)

(assert (=> b!460838 (=> (not res!275617) (not e!268786))))

(assert (=> b!460838 (= res!275617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208649 mask!1025))))

(assert (=> b!460838 (= lt!208649 (array!28616 (store (arr!13747 _keys!709) i!563 k0!794) (size!14100 _keys!709)))))

(declare-fun b!460839 () Bool)

(assert (=> b!460839 (= e!268785 tp_is_empty!12409)))

(declare-fun mapNonEmpty!20266 () Bool)

(declare-fun tp!39051 () Bool)

(assert (=> mapNonEmpty!20266 (= mapRes!20266 (and tp!39051 e!268789))))

(declare-fun mapKey!20266 () (_ BitVec 32))

(declare-fun mapRest!20266 () (Array (_ BitVec 32) ValueCell!5861))

(declare-fun mapValue!20266 () ValueCell!5861)

(assert (=> mapNonEmpty!20266 (= (arr!13748 _values!549) (store mapRest!20266 mapKey!20266 mapValue!20266))))

(assert (= (and start!41214 res!275607) b!460828))

(assert (= (and b!460828 res!275613) b!460824))

(assert (= (and b!460824 res!275612) b!460832))

(assert (= (and b!460832 res!275611) b!460833))

(assert (= (and b!460833 res!275609) b!460835))

(assert (= (and b!460835 res!275616) b!460836))

(assert (= (and b!460836 res!275615) b!460831))

(assert (= (and b!460831 res!275614) b!460823))

(assert (= (and b!460823 res!275608) b!460838))

(assert (= (and b!460838 res!275617) b!460829))

(assert (= (and b!460829 res!275610) b!460834))

(assert (= (and b!460834 res!275618) b!460826))

(assert (= (and b!460826 res!275606) b!460825))

(assert (= (and b!460825 (not res!275605)) b!460827))

(assert (= (and b!460837 condMapEmpty!20266) mapIsEmpty!20266))

(assert (= (and b!460837 (not condMapEmpty!20266)) mapNonEmpty!20266))

(get-info :version)

(assert (= (and mapNonEmpty!20266 ((_ is ValueCellFull!5861) mapValue!20266)) b!460830))

(assert (= (and b!460837 ((_ is ValueCellFull!5861) mapDefault!20266)) b!460839))

(assert (= start!41214 b!460837))

(declare-fun m!443581 () Bool)

(assert (=> b!460838 m!443581))

(declare-fun m!443583 () Bool)

(assert (=> b!460838 m!443583))

(declare-fun m!443585 () Bool)

(assert (=> b!460829 m!443585))

(declare-fun m!443587 () Bool)

(assert (=> mapNonEmpty!20266 m!443587))

(declare-fun m!443589 () Bool)

(assert (=> b!460831 m!443589))

(declare-fun m!443591 () Bool)

(assert (=> b!460833 m!443591))

(declare-fun m!443593 () Bool)

(assert (=> b!460832 m!443593))

(declare-fun m!443595 () Bool)

(assert (=> b!460828 m!443595))

(declare-fun m!443597 () Bool)

(assert (=> b!460826 m!443597))

(declare-fun m!443599 () Bool)

(assert (=> b!460826 m!443599))

(declare-fun m!443601 () Bool)

(assert (=> b!460826 m!443601))

(declare-fun m!443603 () Bool)

(assert (=> start!41214 m!443603))

(declare-fun m!443605 () Bool)

(assert (=> start!41214 m!443605))

(declare-fun m!443607 () Bool)

(assert (=> b!460823 m!443607))

(declare-fun m!443609 () Bool)

(assert (=> b!460825 m!443609))

(declare-fun m!443611 () Bool)

(assert (=> b!460825 m!443611))

(declare-fun m!443613 () Bool)

(assert (=> b!460825 m!443613))

(assert (=> b!460825 m!443613))

(declare-fun m!443615 () Bool)

(assert (=> b!460825 m!443615))

(assert (=> b!460825 m!443609))

(declare-fun m!443617 () Bool)

(assert (=> b!460825 m!443617))

(declare-fun m!443619 () Bool)

(assert (=> b!460825 m!443619))

(declare-fun m!443621 () Bool)

(assert (=> b!460836 m!443621))

(check-sat (not start!41214) (not b!460833) (not b!460829) tp_is_empty!12409 (not b_next!11071) (not b!460826) (not b!460832) b_and!19365 (not mapNonEmpty!20266) (not b!460823) (not b!460838) (not b!460836) (not b!460825) (not b!460828))
(check-sat b_and!19365 (not b_next!11071))
