; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82818 () Bool)

(assert start!82818)

(declare-fun b_free!18945 () Bool)

(declare-fun b_next!18945 () Bool)

(assert (=> start!82818 (= b_free!18945 (not b_next!18945))))

(declare-fun tp!65963 () Bool)

(declare-fun b_and!30433 () Bool)

(assert (=> start!82818 (= tp!65963 b_and!30433)))

(declare-fun b!966074 () Bool)

(declare-fun res!646662 () Bool)

(declare-fun e!544599 () Bool)

(assert (=> b!966074 (=> (not res!646662) (not e!544599))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33987 0))(
  ( (V!33988 (val!10927 Int)) )
))
(declare-datatypes ((ValueCell!10395 0))(
  ( (ValueCellFull!10395 (v!13485 V!33987)) (EmptyCell!10395) )
))
(declare-datatypes ((array!59591 0))(
  ( (array!59592 (arr!28664 (Array (_ BitVec 32) ValueCell!10395)) (size!29143 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59591)

(declare-datatypes ((array!59593 0))(
  ( (array!59594 (arr!28665 (Array (_ BitVec 32) (_ BitVec 64))) (size!29144 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59593)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966074 (= res!646662 (and (= (size!29143 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29144 _keys!1686) (size!29143 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!646658 () Bool)

(assert (=> start!82818 (=> (not res!646658) (not e!544599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82818 (= res!646658 (validMask!0 mask!2110))))

(assert (=> start!82818 e!544599))

(assert (=> start!82818 true))

(declare-fun e!544598 () Bool)

(declare-fun array_inv!22203 (array!59591) Bool)

(assert (=> start!82818 (and (array_inv!22203 _values!1400) e!544598)))

(declare-fun array_inv!22204 (array!59593) Bool)

(assert (=> start!82818 (array_inv!22204 _keys!1686)))

(assert (=> start!82818 tp!65963))

(declare-fun tp_is_empty!21753 () Bool)

(assert (=> start!82818 tp_is_empty!21753))

(declare-fun b!966075 () Bool)

(declare-fun res!646661 () Bool)

(assert (=> b!966075 (=> (not res!646661) (not e!544599))))

(declare-datatypes ((List!19893 0))(
  ( (Nil!19890) (Cons!19889 (h!21051 (_ BitVec 64)) (t!28256 List!19893)) )
))
(declare-fun arrayNoDuplicates!0 (array!59593 (_ BitVec 32) List!19893) Bool)

(assert (=> b!966075 (= res!646661 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19890))))

(declare-fun b!966076 () Bool)

(declare-fun e!544597 () Bool)

(assert (=> b!966076 (= e!544597 tp_is_empty!21753)))

(declare-fun mapNonEmpty!34624 () Bool)

(declare-fun mapRes!34624 () Bool)

(declare-fun tp!65964 () Bool)

(declare-fun e!544600 () Bool)

(assert (=> mapNonEmpty!34624 (= mapRes!34624 (and tp!65964 e!544600))))

(declare-fun mapValue!34624 () ValueCell!10395)

(declare-fun mapKey!34624 () (_ BitVec 32))

(declare-fun mapRest!34624 () (Array (_ BitVec 32) ValueCell!10395))

(assert (=> mapNonEmpty!34624 (= (arr!28664 _values!1400) (store mapRest!34624 mapKey!34624 mapValue!34624))))

(declare-fun b!966077 () Bool)

(declare-fun res!646663 () Bool)

(assert (=> b!966077 (=> (not res!646663) (not e!544599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59593 (_ BitVec 32)) Bool)

(assert (=> b!966077 (= res!646663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966078 () Bool)

(assert (=> b!966078 (= e!544598 (and e!544597 mapRes!34624))))

(declare-fun condMapEmpty!34624 () Bool)

(declare-fun mapDefault!34624 () ValueCell!10395)

(assert (=> b!966078 (= condMapEmpty!34624 (= (arr!28664 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10395)) mapDefault!34624)))))

(declare-fun b!966079 () Bool)

(assert (=> b!966079 (= e!544600 tp_is_empty!21753)))

(declare-fun b!966080 () Bool)

(declare-fun res!646660 () Bool)

(assert (=> b!966080 (=> (not res!646660) (not e!544599))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966080 (= res!646660 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29144 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29144 _keys!1686))))))

(declare-fun b!966081 () Bool)

(declare-fun res!646659 () Bool)

(assert (=> b!966081 (=> (not res!646659) (not e!544599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966081 (= res!646659 (validKeyInArray!0 (select (arr!28665 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34624 () Bool)

(assert (=> mapIsEmpty!34624 mapRes!34624))

(declare-fun b!966082 () Bool)

(assert (=> b!966082 (= e!544599 false)))

(declare-fun minValue!1342 () V!33987)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431293 () Bool)

(declare-fun zeroValue!1342 () V!33987)

(declare-datatypes ((tuple2!14052 0))(
  ( (tuple2!14053 (_1!7037 (_ BitVec 64)) (_2!7037 V!33987)) )
))
(declare-datatypes ((List!19894 0))(
  ( (Nil!19891) (Cons!19890 (h!21052 tuple2!14052) (t!28257 List!19894)) )
))
(declare-datatypes ((ListLongMap!12749 0))(
  ( (ListLongMap!12750 (toList!6390 List!19894)) )
))
(declare-fun contains!5491 (ListLongMap!12749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3623 (array!59593 array!59591 (_ BitVec 32) (_ BitVec 32) V!33987 V!33987 (_ BitVec 32) Int) ListLongMap!12749)

(assert (=> b!966082 (= lt!431293 (contains!5491 (getCurrentListMap!3623 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28665 _keys!1686) i!803)))))

(assert (= (and start!82818 res!646658) b!966074))

(assert (= (and b!966074 res!646662) b!966077))

(assert (= (and b!966077 res!646663) b!966075))

(assert (= (and b!966075 res!646661) b!966080))

(assert (= (and b!966080 res!646660) b!966081))

(assert (= (and b!966081 res!646659) b!966082))

(assert (= (and b!966078 condMapEmpty!34624) mapIsEmpty!34624))

(assert (= (and b!966078 (not condMapEmpty!34624)) mapNonEmpty!34624))

(get-info :version)

(assert (= (and mapNonEmpty!34624 ((_ is ValueCellFull!10395) mapValue!34624)) b!966079))

(assert (= (and b!966078 ((_ is ValueCellFull!10395) mapDefault!34624)) b!966076))

(assert (= start!82818 b!966078))

(declare-fun m!894959 () Bool)

(assert (=> b!966082 m!894959))

(declare-fun m!894961 () Bool)

(assert (=> b!966082 m!894961))

(assert (=> b!966082 m!894959))

(assert (=> b!966082 m!894961))

(declare-fun m!894963 () Bool)

(assert (=> b!966082 m!894963))

(declare-fun m!894965 () Bool)

(assert (=> start!82818 m!894965))

(declare-fun m!894967 () Bool)

(assert (=> start!82818 m!894967))

(declare-fun m!894969 () Bool)

(assert (=> start!82818 m!894969))

(declare-fun m!894971 () Bool)

(assert (=> b!966075 m!894971))

(declare-fun m!894973 () Bool)

(assert (=> mapNonEmpty!34624 m!894973))

(declare-fun m!894975 () Bool)

(assert (=> b!966077 m!894975))

(assert (=> b!966081 m!894961))

(assert (=> b!966081 m!894961))

(declare-fun m!894977 () Bool)

(assert (=> b!966081 m!894977))

(check-sat (not start!82818) (not b!966082) (not b!966077) b_and!30433 (not b_next!18945) (not b!966081) (not mapNonEmpty!34624) (not b!966075) tp_is_empty!21753)
(check-sat b_and!30433 (not b_next!18945))
