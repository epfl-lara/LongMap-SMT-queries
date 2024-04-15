; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82762 () Bool)

(assert start!82762)

(declare-fun b_free!18913 () Bool)

(declare-fun b_next!18913 () Bool)

(assert (=> start!82762 (= b_free!18913 (not b_next!18913))))

(declare-fun tp!65860 () Bool)

(declare-fun b_and!30375 () Bool)

(assert (=> start!82762 (= tp!65860 b_and!30375)))

(declare-fun b!965333 () Bool)

(declare-fun res!646222 () Bool)

(declare-fun e!544165 () Bool)

(assert (=> b!965333 (=> (not res!646222) (not e!544165))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33937 0))(
  ( (V!33938 (val!10908 Int)) )
))
(declare-datatypes ((ValueCell!10376 0))(
  ( (ValueCellFull!10376 (v!13465 V!33937)) (EmptyCell!10376) )
))
(declare-datatypes ((array!59448 0))(
  ( (array!59449 (arr!28593 (Array (_ BitVec 32) ValueCell!10376)) (size!29074 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59448)

(declare-datatypes ((array!59450 0))(
  ( (array!59451 (arr!28594 (Array (_ BitVec 32) (_ BitVec 64))) (size!29075 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59450)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33937)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33937)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14094 0))(
  ( (tuple2!14095 (_1!7058 (_ BitVec 64)) (_2!7058 V!33937)) )
))
(declare-datatypes ((List!19900 0))(
  ( (Nil!19897) (Cons!19896 (h!21058 tuple2!14094) (t!28254 List!19900)) )
))
(declare-datatypes ((ListLongMap!12781 0))(
  ( (ListLongMap!12782 (toList!6406 List!19900)) )
))
(declare-fun contains!5453 (ListLongMap!12781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3568 (array!59450 array!59448 (_ BitVec 32) (_ BitVec 32) V!33937 V!33937 (_ BitVec 32) Int) ListLongMap!12781)

(assert (=> b!965333 (= res!646222 (contains!5453 (getCurrentListMap!3568 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28594 _keys!1686) i!803)))))

(declare-fun b!965334 () Bool)

(declare-fun e!544167 () Bool)

(declare-fun tp_is_empty!21715 () Bool)

(assert (=> b!965334 (= e!544167 tp_is_empty!21715)))

(declare-fun b!965335 () Bool)

(declare-fun res!646223 () Bool)

(assert (=> b!965335 (=> (not res!646223) (not e!544165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965335 (= res!646223 (validKeyInArray!0 (select (arr!28594 _keys!1686) i!803)))))

(declare-fun b!965336 () Bool)

(declare-fun e!544166 () Bool)

(assert (=> b!965336 (= e!544166 tp_is_empty!21715)))

(declare-fun b!965337 () Bool)

(declare-fun res!646221 () Bool)

(assert (=> b!965337 (=> (not res!646221) (not e!544165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59450 (_ BitVec 32)) Bool)

(assert (=> b!965337 (= res!646221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965339 () Bool)

(declare-fun res!646217 () Bool)

(assert (=> b!965339 (=> (not res!646217) (not e!544165))))

(assert (=> b!965339 (= res!646217 (and (= (size!29074 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29075 _keys!1686) (size!29074 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965340 () Bool)

(declare-fun res!646219 () Bool)

(assert (=> b!965340 (=> (not res!646219) (not e!544165))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965340 (= res!646219 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29075 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29075 _keys!1686))))))

(declare-fun mapIsEmpty!34567 () Bool)

(declare-fun mapRes!34567 () Bool)

(assert (=> mapIsEmpty!34567 mapRes!34567))

(declare-fun mapNonEmpty!34567 () Bool)

(declare-fun tp!65859 () Bool)

(assert (=> mapNonEmpty!34567 (= mapRes!34567 (and tp!65859 e!544167))))

(declare-fun mapRest!34567 () (Array (_ BitVec 32) ValueCell!10376))

(declare-fun mapKey!34567 () (_ BitVec 32))

(declare-fun mapValue!34567 () ValueCell!10376)

(assert (=> mapNonEmpty!34567 (= (arr!28593 _values!1400) (store mapRest!34567 mapKey!34567 mapValue!34567))))

(declare-fun b!965341 () Bool)

(declare-fun res!646218 () Bool)

(assert (=> b!965341 (=> (not res!646218) (not e!544165))))

(declare-datatypes ((List!19901 0))(
  ( (Nil!19898) (Cons!19897 (h!21059 (_ BitVec 64)) (t!28255 List!19901)) )
))
(declare-fun arrayNoDuplicates!0 (array!59450 (_ BitVec 32) List!19901) Bool)

(assert (=> b!965341 (= res!646218 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19898))))

(declare-fun b!965342 () Bool)

(assert (=> b!965342 (= e!544165 (and (bvsle from!2084 newFrom!159) (bvsgt newFrom!159 (size!29075 _keys!1686))))))

(declare-fun res!646220 () Bool)

(assert (=> start!82762 (=> (not res!646220) (not e!544165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82762 (= res!646220 (validMask!0 mask!2110))))

(assert (=> start!82762 e!544165))

(assert (=> start!82762 true))

(declare-fun e!544168 () Bool)

(declare-fun array_inv!22201 (array!59448) Bool)

(assert (=> start!82762 (and (array_inv!22201 _values!1400) e!544168)))

(declare-fun array_inv!22202 (array!59450) Bool)

(assert (=> start!82762 (array_inv!22202 _keys!1686)))

(assert (=> start!82762 tp!65860))

(assert (=> start!82762 tp_is_empty!21715))

(declare-fun b!965338 () Bool)

(assert (=> b!965338 (= e!544168 (and e!544166 mapRes!34567))))

(declare-fun condMapEmpty!34567 () Bool)

(declare-fun mapDefault!34567 () ValueCell!10376)

(assert (=> b!965338 (= condMapEmpty!34567 (= (arr!28593 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10376)) mapDefault!34567)))))

(assert (= (and start!82762 res!646220) b!965339))

(assert (= (and b!965339 res!646217) b!965337))

(assert (= (and b!965337 res!646221) b!965341))

(assert (= (and b!965341 res!646218) b!965340))

(assert (= (and b!965340 res!646219) b!965335))

(assert (= (and b!965335 res!646223) b!965333))

(assert (= (and b!965333 res!646222) b!965342))

(assert (= (and b!965338 condMapEmpty!34567) mapIsEmpty!34567))

(assert (= (and b!965338 (not condMapEmpty!34567)) mapNonEmpty!34567))

(get-info :version)

(assert (= (and mapNonEmpty!34567 ((_ is ValueCellFull!10376) mapValue!34567)) b!965334))

(assert (= (and b!965338 ((_ is ValueCellFull!10376) mapDefault!34567)) b!965336))

(assert (= start!82762 b!965338))

(declare-fun m!893851 () Bool)

(assert (=> start!82762 m!893851))

(declare-fun m!893853 () Bool)

(assert (=> start!82762 m!893853))

(declare-fun m!893855 () Bool)

(assert (=> start!82762 m!893855))

(declare-fun m!893857 () Bool)

(assert (=> b!965333 m!893857))

(declare-fun m!893859 () Bool)

(assert (=> b!965333 m!893859))

(assert (=> b!965333 m!893857))

(assert (=> b!965333 m!893859))

(declare-fun m!893861 () Bool)

(assert (=> b!965333 m!893861))

(assert (=> b!965335 m!893859))

(assert (=> b!965335 m!893859))

(declare-fun m!893863 () Bool)

(assert (=> b!965335 m!893863))

(declare-fun m!893865 () Bool)

(assert (=> b!965337 m!893865))

(declare-fun m!893867 () Bool)

(assert (=> mapNonEmpty!34567 m!893867))

(declare-fun m!893869 () Bool)

(assert (=> b!965341 m!893869))

(check-sat (not b!965341) (not mapNonEmpty!34567) (not b!965337) b_and!30375 (not b!965333) (not start!82762) tp_is_empty!21715 (not b_next!18913) (not b!965335))
(check-sat b_and!30375 (not b_next!18913))
