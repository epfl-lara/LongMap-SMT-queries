; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82966 () Bool)

(assert start!82966)

(declare-fun b_free!18925 () Bool)

(declare-fun b_next!18925 () Bool)

(assert (=> start!82966 (= b_free!18925 (not b_next!18925))))

(declare-fun tp!65904 () Bool)

(declare-fun b_and!30423 () Bool)

(assert (=> start!82966 (= tp!65904 b_and!30423)))

(declare-fun res!646824 () Bool)

(declare-fun e!545030 () Bool)

(assert (=> start!82966 (=> (not res!646824) (not e!545030))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82966 (= res!646824 (validMask!0 mask!2110))))

(assert (=> start!82966 e!545030))

(assert (=> start!82966 true))

(declare-datatypes ((V!33961 0))(
  ( (V!33962 (val!10917 Int)) )
))
(declare-datatypes ((ValueCell!10385 0))(
  ( (ValueCellFull!10385 (v!13472 V!33961)) (EmptyCell!10385) )
))
(declare-datatypes ((array!59566 0))(
  ( (array!59567 (arr!28647 (Array (_ BitVec 32) ValueCell!10385)) (size!29127 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59566)

(declare-fun e!545033 () Bool)

(declare-fun array_inv!22241 (array!59566) Bool)

(assert (=> start!82966 (and (array_inv!22241 _values!1400) e!545033)))

(declare-datatypes ((array!59568 0))(
  ( (array!59569 (arr!28648 (Array (_ BitVec 32) (_ BitVec 64))) (size!29128 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59568)

(declare-fun array_inv!22242 (array!59568) Bool)

(assert (=> start!82966 (array_inv!22242 _keys!1686)))

(assert (=> start!82966 tp!65904))

(declare-fun tp_is_empty!21733 () Bool)

(assert (=> start!82966 tp_is_empty!21733))

(declare-fun mapIsEmpty!34594 () Bool)

(declare-fun mapRes!34594 () Bool)

(assert (=> mapIsEmpty!34594 mapRes!34594))

(declare-fun b!966707 () Bool)

(declare-fun res!646827 () Bool)

(assert (=> b!966707 (=> (not res!646827) (not e!545030))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966707 (= res!646827 (validKeyInArray!0 (select (arr!28648 _keys!1686) i!803)))))

(declare-fun b!966708 () Bool)

(declare-fun res!646823 () Bool)

(assert (=> b!966708 (=> (not res!646823) (not e!545030))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966708 (= res!646823 (and (= (size!29127 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29128 _keys!1686) (size!29127 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966709 () Bool)

(declare-fun res!646826 () Bool)

(assert (=> b!966709 (=> (not res!646826) (not e!545030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59568 (_ BitVec 32)) Bool)

(assert (=> b!966709 (= res!646826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966710 () Bool)

(assert (=> b!966710 (= e!545030 false)))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431624 () Bool)

(declare-fun minValue!1342 () V!33961)

(declare-fun zeroValue!1342 () V!33961)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14022 0))(
  ( (tuple2!14023 (_1!7022 (_ BitVec 64)) (_2!7022 V!33961)) )
))
(declare-datatypes ((List!19869 0))(
  ( (Nil!19866) (Cons!19865 (h!21033 tuple2!14022) (t!28224 List!19869)) )
))
(declare-datatypes ((ListLongMap!12721 0))(
  ( (ListLongMap!12722 (toList!6376 List!19869)) )
))
(declare-fun contains!5488 (ListLongMap!12721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3609 (array!59568 array!59566 (_ BitVec 32) (_ BitVec 32) V!33961 V!33961 (_ BitVec 32) Int) ListLongMap!12721)

(assert (=> b!966710 (= lt!431624 (contains!5488 (getCurrentListMap!3609 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28648 _keys!1686) i!803)))))

(declare-fun b!966711 () Bool)

(declare-fun e!545032 () Bool)

(assert (=> b!966711 (= e!545032 tp_is_empty!21733)))

(declare-fun b!966712 () Bool)

(declare-fun res!646825 () Bool)

(assert (=> b!966712 (=> (not res!646825) (not e!545030))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966712 (= res!646825 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29128 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29128 _keys!1686))))))

(declare-fun b!966713 () Bool)

(declare-fun e!545031 () Bool)

(assert (=> b!966713 (= e!545033 (and e!545031 mapRes!34594))))

(declare-fun condMapEmpty!34594 () Bool)

(declare-fun mapDefault!34594 () ValueCell!10385)

(assert (=> b!966713 (= condMapEmpty!34594 (= (arr!28647 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10385)) mapDefault!34594)))))

(declare-fun mapNonEmpty!34594 () Bool)

(declare-fun tp!65905 () Bool)

(assert (=> mapNonEmpty!34594 (= mapRes!34594 (and tp!65905 e!545032))))

(declare-fun mapValue!34594 () ValueCell!10385)

(declare-fun mapKey!34594 () (_ BitVec 32))

(declare-fun mapRest!34594 () (Array (_ BitVec 32) ValueCell!10385))

(assert (=> mapNonEmpty!34594 (= (arr!28647 _values!1400) (store mapRest!34594 mapKey!34594 mapValue!34594))))

(declare-fun b!966714 () Bool)

(declare-fun res!646822 () Bool)

(assert (=> b!966714 (=> (not res!646822) (not e!545030))))

(declare-datatypes ((List!19870 0))(
  ( (Nil!19867) (Cons!19866 (h!21034 (_ BitVec 64)) (t!28225 List!19870)) )
))
(declare-fun arrayNoDuplicates!0 (array!59568 (_ BitVec 32) List!19870) Bool)

(assert (=> b!966714 (= res!646822 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19867))))

(declare-fun b!966715 () Bool)

(assert (=> b!966715 (= e!545031 tp_is_empty!21733)))

(assert (= (and start!82966 res!646824) b!966708))

(assert (= (and b!966708 res!646823) b!966709))

(assert (= (and b!966709 res!646826) b!966714))

(assert (= (and b!966714 res!646822) b!966712))

(assert (= (and b!966712 res!646825) b!966707))

(assert (= (and b!966707 res!646827) b!966710))

(assert (= (and b!966713 condMapEmpty!34594) mapIsEmpty!34594))

(assert (= (and b!966713 (not condMapEmpty!34594)) mapNonEmpty!34594))

(get-info :version)

(assert (= (and mapNonEmpty!34594 ((_ is ValueCellFull!10385) mapValue!34594)) b!966711))

(assert (= (and b!966713 ((_ is ValueCellFull!10385) mapDefault!34594)) b!966715))

(assert (= start!82966 b!966713))

(declare-fun m!896053 () Bool)

(assert (=> start!82966 m!896053))

(declare-fun m!896055 () Bool)

(assert (=> start!82966 m!896055))

(declare-fun m!896057 () Bool)

(assert (=> start!82966 m!896057))

(declare-fun m!896059 () Bool)

(assert (=> b!966709 m!896059))

(declare-fun m!896061 () Bool)

(assert (=> b!966714 m!896061))

(declare-fun m!896063 () Bool)

(assert (=> b!966710 m!896063))

(declare-fun m!896065 () Bool)

(assert (=> b!966710 m!896065))

(assert (=> b!966710 m!896063))

(assert (=> b!966710 m!896065))

(declare-fun m!896067 () Bool)

(assert (=> b!966710 m!896067))

(declare-fun m!896069 () Bool)

(assert (=> mapNonEmpty!34594 m!896069))

(assert (=> b!966707 m!896065))

(assert (=> b!966707 m!896065))

(declare-fun m!896071 () Bool)

(assert (=> b!966707 m!896071))

(check-sat (not b!966709) (not mapNonEmpty!34594) (not b!966714) (not start!82966) (not b!966707) (not b_next!18925) tp_is_empty!21733 b_and!30423 (not b!966710))
(check-sat b_and!30423 (not b_next!18925))
