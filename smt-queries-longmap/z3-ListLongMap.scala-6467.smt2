; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82624 () Bool)

(assert start!82624)

(declare-fun b_free!18775 () Bool)

(declare-fun b_next!18775 () Bool)

(assert (=> start!82624 (= b_free!18775 (not b_next!18775))))

(declare-fun tp!65446 () Bool)

(declare-fun b_and!30237 () Bool)

(assert (=> start!82624 (= tp!65446 b_and!30237)))

(declare-fun b!963121 () Bool)

(declare-fun res!644629 () Bool)

(declare-fun e!543052 () Bool)

(assert (=> b!963121 (=> (not res!644629) (not e!543052))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963121 (= res!644629 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963122 () Bool)

(declare-fun res!644628 () Bool)

(assert (=> b!963122 (=> (not res!644628) (not e!543052))))

(declare-datatypes ((array!59180 0))(
  ( (array!59181 (arr!28459 (Array (_ BitVec 32) (_ BitVec 64))) (size!28940 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59180)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963122 (= res!644628 (validKeyInArray!0 (select (arr!28459 _keys!1686) i!803)))))

(declare-fun b!963123 () Bool)

(declare-fun res!644631 () Bool)

(assert (=> b!963123 (=> (not res!644631) (not e!543052))))

(assert (=> b!963123 (= res!644631 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28940 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28940 _keys!1686))))))

(declare-fun mapNonEmpty!34360 () Bool)

(declare-fun mapRes!34360 () Bool)

(declare-fun tp!65445 () Bool)

(declare-fun e!543051 () Bool)

(assert (=> mapNonEmpty!34360 (= mapRes!34360 (and tp!65445 e!543051))))

(declare-fun mapKey!34360 () (_ BitVec 32))

(declare-datatypes ((V!33753 0))(
  ( (V!33754 (val!10839 Int)) )
))
(declare-datatypes ((ValueCell!10307 0))(
  ( (ValueCellFull!10307 (v!13396 V!33753)) (EmptyCell!10307) )
))
(declare-fun mapValue!34360 () ValueCell!10307)

(declare-fun mapRest!34360 () (Array (_ BitVec 32) ValueCell!10307))

(declare-datatypes ((array!59182 0))(
  ( (array!59183 (arr!28460 (Array (_ BitVec 32) ValueCell!10307)) (size!28941 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59182)

(assert (=> mapNonEmpty!34360 (= (arr!28460 _values!1400) (store mapRest!34360 mapKey!34360 mapValue!34360))))

(declare-fun mapIsEmpty!34360 () Bool)

(assert (=> mapIsEmpty!34360 mapRes!34360))

(declare-fun b!963124 () Bool)

(declare-fun res!644633 () Bool)

(assert (=> b!963124 (=> (not res!644633) (not e!543052))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59180 (_ BitVec 32)) Bool)

(assert (=> b!963124 (= res!644633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644630 () Bool)

(assert (=> start!82624 (=> (not res!644630) (not e!543052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82624 (= res!644630 (validMask!0 mask!2110))))

(assert (=> start!82624 e!543052))

(assert (=> start!82624 true))

(declare-fun e!543050 () Bool)

(declare-fun array_inv!22109 (array!59182) Bool)

(assert (=> start!82624 (and (array_inv!22109 _values!1400) e!543050)))

(declare-fun array_inv!22110 (array!59180) Bool)

(assert (=> start!82624 (array_inv!22110 _keys!1686)))

(assert (=> start!82624 tp!65446))

(declare-fun tp_is_empty!21577 () Bool)

(assert (=> start!82624 tp_is_empty!21577))

(declare-fun b!963125 () Bool)

(assert (=> b!963125 (= e!543051 tp_is_empty!21577)))

(declare-fun b!963126 () Bool)

(declare-fun res!644626 () Bool)

(assert (=> b!963126 (=> (not res!644626) (not e!543052))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963126 (= res!644626 (and (= (size!28941 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28940 _keys!1686) (size!28941 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963127 () Bool)

(declare-fun e!543049 () Bool)

(assert (=> b!963127 (= e!543049 tp_is_empty!21577)))

(declare-fun b!963128 () Bool)

(declare-fun res!644627 () Bool)

(assert (=> b!963128 (=> (not res!644627) (not e!543052))))

(declare-datatypes ((List!19795 0))(
  ( (Nil!19792) (Cons!19791 (h!20953 (_ BitVec 64)) (t!28149 List!19795)) )
))
(declare-fun arrayNoDuplicates!0 (array!59180 (_ BitVec 32) List!19795) Bool)

(assert (=> b!963128 (= res!644627 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19792))))

(declare-fun b!963129 () Bool)

(declare-fun res!644632 () Bool)

(assert (=> b!963129 (=> (not res!644632) (not e!543052))))

(declare-fun minValue!1342 () V!33753)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33753)

(declare-datatypes ((tuple2!13986 0))(
  ( (tuple2!13987 (_1!7004 (_ BitVec 64)) (_2!7004 V!33753)) )
))
(declare-datatypes ((List!19796 0))(
  ( (Nil!19793) (Cons!19792 (h!20954 tuple2!13986) (t!28150 List!19796)) )
))
(declare-datatypes ((ListLongMap!12673 0))(
  ( (ListLongMap!12674 (toList!6352 List!19796)) )
))
(declare-fun contains!5399 (ListLongMap!12673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3514 (array!59180 array!59182 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) Int) ListLongMap!12673)

(assert (=> b!963129 (= res!644632 (contains!5399 (getCurrentListMap!3514 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28459 _keys!1686) i!803)))))

(declare-fun b!963130 () Bool)

(assert (=> b!963130 (= e!543052 (not true))))

(assert (=> b!963130 (contains!5399 (getCurrentListMap!3514 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28459 _keys!1686) i!803))))

(declare-datatypes ((Unit!32092 0))(
  ( (Unit!32093) )
))
(declare-fun lt!430730 () Unit!32092)

(declare-fun lemmaInListMapFromThenInFromMinusOne!12 (array!59180 array!59182 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) (_ BitVec 32) Int) Unit!32092)

(assert (=> b!963130 (= lt!430730 (lemmaInListMapFromThenInFromMinusOne!12 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963131 () Bool)

(assert (=> b!963131 (= e!543050 (and e!543049 mapRes!34360))))

(declare-fun condMapEmpty!34360 () Bool)

(declare-fun mapDefault!34360 () ValueCell!10307)

(assert (=> b!963131 (= condMapEmpty!34360 (= (arr!28460 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10307)) mapDefault!34360)))))

(assert (= (and start!82624 res!644630) b!963126))

(assert (= (and b!963126 res!644626) b!963124))

(assert (= (and b!963124 res!644633) b!963128))

(assert (= (and b!963128 res!644627) b!963123))

(assert (= (and b!963123 res!644631) b!963122))

(assert (= (and b!963122 res!644628) b!963129))

(assert (= (and b!963129 res!644632) b!963121))

(assert (= (and b!963121 res!644629) b!963130))

(assert (= (and b!963131 condMapEmpty!34360) mapIsEmpty!34360))

(assert (= (and b!963131 (not condMapEmpty!34360)) mapNonEmpty!34360))

(get-info :version)

(assert (= (and mapNonEmpty!34360 ((_ is ValueCellFull!10307) mapValue!34360)) b!963125))

(assert (= (and b!963131 ((_ is ValueCellFull!10307) mapDefault!34360)) b!963127))

(assert (= start!82624 b!963131))

(declare-fun m!892039 () Bool)

(assert (=> start!82624 m!892039))

(declare-fun m!892041 () Bool)

(assert (=> start!82624 m!892041))

(declare-fun m!892043 () Bool)

(assert (=> start!82624 m!892043))

(declare-fun m!892045 () Bool)

(assert (=> b!963122 m!892045))

(assert (=> b!963122 m!892045))

(declare-fun m!892047 () Bool)

(assert (=> b!963122 m!892047))

(declare-fun m!892049 () Bool)

(assert (=> b!963124 m!892049))

(declare-fun m!892051 () Bool)

(assert (=> b!963129 m!892051))

(assert (=> b!963129 m!892045))

(assert (=> b!963129 m!892051))

(assert (=> b!963129 m!892045))

(declare-fun m!892053 () Bool)

(assert (=> b!963129 m!892053))

(declare-fun m!892055 () Bool)

(assert (=> mapNonEmpty!34360 m!892055))

(declare-fun m!892057 () Bool)

(assert (=> b!963130 m!892057))

(assert (=> b!963130 m!892045))

(assert (=> b!963130 m!892057))

(assert (=> b!963130 m!892045))

(declare-fun m!892059 () Bool)

(assert (=> b!963130 m!892059))

(declare-fun m!892061 () Bool)

(assert (=> b!963130 m!892061))

(declare-fun m!892063 () Bool)

(assert (=> b!963128 m!892063))

(check-sat (not b!963129) (not b!963130) (not mapNonEmpty!34360) tp_is_empty!21577 (not b_next!18775) (not start!82624) (not b!963122) b_and!30237 (not b!963128) (not b!963124))
(check-sat b_and!30237 (not b_next!18775))
