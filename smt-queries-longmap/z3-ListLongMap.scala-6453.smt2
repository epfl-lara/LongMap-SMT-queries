; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82540 () Bool)

(assert start!82540)

(declare-fun b_free!18691 () Bool)

(declare-fun b_next!18691 () Bool)

(assert (=> start!82540 (= b_free!18691 (not b_next!18691))))

(declare-fun tp!65194 () Bool)

(declare-fun b_and!30153 () Bool)

(assert (=> start!82540 (= tp!65194 b_and!30153)))

(declare-fun b!961875 () Bool)

(declare-fun res!643763 () Bool)

(declare-fun e!542421 () Bool)

(assert (=> b!961875 (=> (not res!643763) (not e!542421))))

(declare-datatypes ((array!59014 0))(
  ( (array!59015 (arr!28376 (Array (_ BitVec 32) (_ BitVec 64))) (size!28857 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59014)

(declare-datatypes ((List!19734 0))(
  ( (Nil!19731) (Cons!19730 (h!20892 (_ BitVec 64)) (t!28088 List!19734)) )
))
(declare-fun arrayNoDuplicates!0 (array!59014 (_ BitVec 32) List!19734) Bool)

(assert (=> b!961875 (= res!643763 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19731))))

(declare-fun b!961876 () Bool)

(declare-fun e!542422 () Bool)

(declare-fun tp_is_empty!21493 () Bool)

(assert (=> b!961876 (= e!542422 tp_is_empty!21493)))

(declare-fun b!961877 () Bool)

(declare-fun res!643762 () Bool)

(assert (=> b!961877 (=> (not res!643762) (not e!542421))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59014 (_ BitVec 32)) Bool)

(assert (=> b!961877 (= res!643762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961878 () Bool)

(declare-fun res!643761 () Bool)

(assert (=> b!961878 (=> (not res!643761) (not e!542421))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33641 0))(
  ( (V!33642 (val!10797 Int)) )
))
(declare-datatypes ((ValueCell!10265 0))(
  ( (ValueCellFull!10265 (v!13354 V!33641)) (EmptyCell!10265) )
))
(declare-datatypes ((array!59016 0))(
  ( (array!59017 (arr!28377 (Array (_ BitVec 32) ValueCell!10265)) (size!28858 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59016)

(assert (=> b!961878 (= res!643761 (and (= (size!28858 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28857 _keys!1686) (size!28858 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34234 () Bool)

(declare-fun mapRes!34234 () Bool)

(assert (=> mapIsEmpty!34234 mapRes!34234))

(declare-fun b!961880 () Bool)

(declare-fun res!643760 () Bool)

(assert (=> b!961880 (=> (not res!643760) (not e!542421))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961880 (= res!643760 (validKeyInArray!0 (select (arr!28376 _keys!1686) i!803)))))

(declare-fun b!961881 () Bool)

(declare-fun e!542419 () Bool)

(assert (=> b!961881 (= e!542419 tp_is_empty!21493)))

(declare-fun mapNonEmpty!34234 () Bool)

(declare-fun tp!65193 () Bool)

(assert (=> mapNonEmpty!34234 (= mapRes!34234 (and tp!65193 e!542419))))

(declare-fun mapKey!34234 () (_ BitVec 32))

(declare-fun mapRest!34234 () (Array (_ BitVec 32) ValueCell!10265))

(declare-fun mapValue!34234 () ValueCell!10265)

(assert (=> mapNonEmpty!34234 (= (arr!28377 _values!1400) (store mapRest!34234 mapKey!34234 mapValue!34234))))

(declare-fun b!961882 () Bool)

(declare-fun res!643758 () Bool)

(assert (=> b!961882 (=> (not res!643758) (not e!542421))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!961882 (= res!643758 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28857 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28857 _keys!1686))))))

(declare-fun b!961883 () Bool)

(assert (=> b!961883 (= e!542421 false)))

(declare-fun lt!430604 () Bool)

(declare-fun minValue!1342 () V!33641)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33641)

(declare-datatypes ((tuple2!13926 0))(
  ( (tuple2!13927 (_1!6974 (_ BitVec 64)) (_2!6974 V!33641)) )
))
(declare-datatypes ((List!19735 0))(
  ( (Nil!19732) (Cons!19731 (h!20893 tuple2!13926) (t!28089 List!19735)) )
))
(declare-datatypes ((ListLongMap!12613 0))(
  ( (ListLongMap!12614 (toList!6322 List!19735)) )
))
(declare-fun contains!5369 (ListLongMap!12613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3484 (array!59014 array!59016 (_ BitVec 32) (_ BitVec 32) V!33641 V!33641 (_ BitVec 32) Int) ListLongMap!12613)

(assert (=> b!961883 (= lt!430604 (contains!5369 (getCurrentListMap!3484 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28376 _keys!1686) i!803)))))

(declare-fun res!643759 () Bool)

(assert (=> start!82540 (=> (not res!643759) (not e!542421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82540 (= res!643759 (validMask!0 mask!2110))))

(assert (=> start!82540 e!542421))

(assert (=> start!82540 true))

(declare-fun e!542420 () Bool)

(declare-fun array_inv!22047 (array!59016) Bool)

(assert (=> start!82540 (and (array_inv!22047 _values!1400) e!542420)))

(declare-fun array_inv!22048 (array!59014) Bool)

(assert (=> start!82540 (array_inv!22048 _keys!1686)))

(assert (=> start!82540 tp!65194))

(assert (=> start!82540 tp_is_empty!21493))

(declare-fun b!961879 () Bool)

(assert (=> b!961879 (= e!542420 (and e!542422 mapRes!34234))))

(declare-fun condMapEmpty!34234 () Bool)

(declare-fun mapDefault!34234 () ValueCell!10265)

(assert (=> b!961879 (= condMapEmpty!34234 (= (arr!28377 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10265)) mapDefault!34234)))))

(assert (= (and start!82540 res!643759) b!961878))

(assert (= (and b!961878 res!643761) b!961877))

(assert (= (and b!961877 res!643762) b!961875))

(assert (= (and b!961875 res!643763) b!961882))

(assert (= (and b!961882 res!643758) b!961880))

(assert (= (and b!961880 res!643760) b!961883))

(assert (= (and b!961879 condMapEmpty!34234) mapIsEmpty!34234))

(assert (= (and b!961879 (not condMapEmpty!34234)) mapNonEmpty!34234))

(get-info :version)

(assert (= (and mapNonEmpty!34234 ((_ is ValueCellFull!10265) mapValue!34234)) b!961881))

(assert (= (and b!961879 ((_ is ValueCellFull!10265) mapDefault!34234)) b!961876))

(assert (= start!82540 b!961879))

(declare-fun m!891091 () Bool)

(assert (=> mapNonEmpty!34234 m!891091))

(declare-fun m!891093 () Bool)

(assert (=> b!961875 m!891093))

(declare-fun m!891095 () Bool)

(assert (=> b!961883 m!891095))

(declare-fun m!891097 () Bool)

(assert (=> b!961883 m!891097))

(assert (=> b!961883 m!891095))

(assert (=> b!961883 m!891097))

(declare-fun m!891099 () Bool)

(assert (=> b!961883 m!891099))

(declare-fun m!891101 () Bool)

(assert (=> b!961877 m!891101))

(assert (=> b!961880 m!891097))

(assert (=> b!961880 m!891097))

(declare-fun m!891103 () Bool)

(assert (=> b!961880 m!891103))

(declare-fun m!891105 () Bool)

(assert (=> start!82540 m!891105))

(declare-fun m!891107 () Bool)

(assert (=> start!82540 m!891107))

(declare-fun m!891109 () Bool)

(assert (=> start!82540 m!891109))

(check-sat (not start!82540) (not b!961880) tp_is_empty!21493 (not mapNonEmpty!34234) (not b_next!18691) (not b!961877) b_and!30153 (not b!961875) (not b!961883))
(check-sat b_and!30153 (not b_next!18691))
