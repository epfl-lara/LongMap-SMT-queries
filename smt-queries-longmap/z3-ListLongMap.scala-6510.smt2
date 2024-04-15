; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82882 () Bool)

(assert start!82882)

(declare-fun b_free!19027 () Bool)

(declare-fun b_next!19027 () Bool)

(assert (=> start!82882 (= b_free!19027 (not b_next!19027))))

(declare-fun tp!66211 () Bool)

(declare-fun b_and!30489 () Bool)

(assert (=> start!82882 (= tp!66211 b_and!30489)))

(declare-fun b!967045 () Bool)

(declare-fun res!647394 () Bool)

(declare-fun e!545068 () Bool)

(assert (=> b!967045 (=> (not res!647394) (not e!545068))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34097 0))(
  ( (V!34098 (val!10968 Int)) )
))
(declare-datatypes ((ValueCell!10436 0))(
  ( (ValueCellFull!10436 (v!13525 V!34097)) (EmptyCell!10436) )
))
(declare-datatypes ((array!59674 0))(
  ( (array!59675 (arr!28706 (Array (_ BitVec 32) ValueCell!10436)) (size!29187 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59674)

(declare-datatypes ((array!59676 0))(
  ( (array!59677 (arr!28707 (Array (_ BitVec 32) (_ BitVec 64))) (size!29188 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59676)

(declare-fun minValue!1342 () V!34097)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34097)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14178 0))(
  ( (tuple2!14179 (_1!7100 (_ BitVec 64)) (_2!7100 V!34097)) )
))
(declare-datatypes ((List!19983 0))(
  ( (Nil!19980) (Cons!19979 (h!21141 tuple2!14178) (t!28337 List!19983)) )
))
(declare-datatypes ((ListLongMap!12865 0))(
  ( (ListLongMap!12866 (toList!6448 List!19983)) )
))
(declare-fun contains!5493 (ListLongMap!12865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3610 (array!59676 array!59674 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) Int) ListLongMap!12865)

(assert (=> b!967045 (= res!647394 (contains!5493 (getCurrentListMap!3610 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28707 _keys!1686) i!803)))))

(declare-fun b!967046 () Bool)

(declare-fun res!647391 () Bool)

(assert (=> b!967046 (=> (not res!647391) (not e!545068))))

(declare-datatypes ((List!19984 0))(
  ( (Nil!19981) (Cons!19980 (h!21142 (_ BitVec 64)) (t!28338 List!19984)) )
))
(declare-fun arrayNoDuplicates!0 (array!59676 (_ BitVec 32) List!19984) Bool)

(assert (=> b!967046 (= res!647391 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19981))))

(declare-fun b!967047 () Bool)

(declare-fun res!647389 () Bool)

(assert (=> b!967047 (=> (not res!647389) (not e!545068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59676 (_ BitVec 32)) Bool)

(assert (=> b!967047 (= res!647389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34747 () Bool)

(declare-fun mapRes!34747 () Bool)

(assert (=> mapIsEmpty!34747 mapRes!34747))

(declare-fun b!967048 () Bool)

(declare-fun e!545067 () Bool)

(declare-fun e!545064 () Bool)

(assert (=> b!967048 (= e!545067 (and e!545064 mapRes!34747))))

(declare-fun condMapEmpty!34747 () Bool)

(declare-fun mapDefault!34747 () ValueCell!10436)

(assert (=> b!967048 (= condMapEmpty!34747 (= (arr!28706 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10436)) mapDefault!34747)))))

(declare-fun mapNonEmpty!34747 () Bool)

(declare-fun tp!66210 () Bool)

(declare-fun e!545065 () Bool)

(assert (=> mapNonEmpty!34747 (= mapRes!34747 (and tp!66210 e!545065))))

(declare-fun mapValue!34747 () ValueCell!10436)

(declare-fun mapRest!34747 () (Array (_ BitVec 32) ValueCell!10436))

(declare-fun mapKey!34747 () (_ BitVec 32))

(assert (=> mapNonEmpty!34747 (= (arr!28706 _values!1400) (store mapRest!34747 mapKey!34747 mapValue!34747))))

(declare-fun res!647395 () Bool)

(assert (=> start!82882 (=> (not res!647395) (not e!545068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82882 (= res!647395 (validMask!0 mask!2110))))

(assert (=> start!82882 e!545068))

(assert (=> start!82882 true))

(declare-fun array_inv!22289 (array!59674) Bool)

(assert (=> start!82882 (and (array_inv!22289 _values!1400) e!545067)))

(declare-fun array_inv!22290 (array!59676) Bool)

(assert (=> start!82882 (array_inv!22290 _keys!1686)))

(assert (=> start!82882 tp!66211))

(declare-fun tp_is_empty!21835 () Bool)

(assert (=> start!82882 tp_is_empty!21835))

(declare-fun b!967049 () Bool)

(declare-fun res!647393 () Bool)

(assert (=> b!967049 (=> (not res!647393) (not e!545068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967049 (= res!647393 (validKeyInArray!0 (select (arr!28707 _keys!1686) i!803)))))

(declare-fun b!967050 () Bool)

(declare-fun res!647392 () Bool)

(assert (=> b!967050 (=> (not res!647392) (not e!545068))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967050 (= res!647392 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29188 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29188 _keys!1686))))))

(declare-fun b!967051 () Bool)

(assert (=> b!967051 (= e!545068 (not true))))

(assert (=> b!967051 (contains!5493 (getCurrentListMap!3610 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28707 _keys!1686) i!803))))

(declare-datatypes ((Unit!32188 0))(
  ( (Unit!32189) )
))
(declare-fun lt!431171 () Unit!32188)

(declare-fun lemmaInListMapFromThenInFromMinusOne!58 (array!59676 array!59674 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) (_ BitVec 32) Int) Unit!32188)

(assert (=> b!967051 (= lt!431171 (lemmaInListMapFromThenInFromMinusOne!58 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967052 () Bool)

(assert (=> b!967052 (= e!545065 tp_is_empty!21835)))

(declare-fun b!967053 () Bool)

(declare-fun res!647396 () Bool)

(assert (=> b!967053 (=> (not res!647396) (not e!545068))))

(assert (=> b!967053 (= res!647396 (and (= (size!29187 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29188 _keys!1686) (size!29187 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967054 () Bool)

(assert (=> b!967054 (= e!545064 tp_is_empty!21835)))

(declare-fun b!967055 () Bool)

(declare-fun res!647390 () Bool)

(assert (=> b!967055 (=> (not res!647390) (not e!545068))))

(assert (=> b!967055 (= res!647390 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82882 res!647395) b!967053))

(assert (= (and b!967053 res!647396) b!967047))

(assert (= (and b!967047 res!647389) b!967046))

(assert (= (and b!967046 res!647391) b!967050))

(assert (= (and b!967050 res!647392) b!967049))

(assert (= (and b!967049 res!647393) b!967045))

(assert (= (and b!967045 res!647394) b!967055))

(assert (= (and b!967055 res!647390) b!967051))

(assert (= (and b!967048 condMapEmpty!34747) mapIsEmpty!34747))

(assert (= (and b!967048 (not condMapEmpty!34747)) mapNonEmpty!34747))

(get-info :version)

(assert (= (and mapNonEmpty!34747 ((_ is ValueCellFull!10436) mapValue!34747)) b!967052))

(assert (= (and b!967048 ((_ is ValueCellFull!10436) mapDefault!34747)) b!967054))

(assert (= start!82882 b!967048))

(declare-fun m!895111 () Bool)

(assert (=> b!967046 m!895111))

(declare-fun m!895113 () Bool)

(assert (=> b!967047 m!895113))

(declare-fun m!895115 () Bool)

(assert (=> mapNonEmpty!34747 m!895115))

(declare-fun m!895117 () Bool)

(assert (=> b!967045 m!895117))

(declare-fun m!895119 () Bool)

(assert (=> b!967045 m!895119))

(assert (=> b!967045 m!895117))

(assert (=> b!967045 m!895119))

(declare-fun m!895121 () Bool)

(assert (=> b!967045 m!895121))

(declare-fun m!895123 () Bool)

(assert (=> b!967051 m!895123))

(assert (=> b!967051 m!895119))

(assert (=> b!967051 m!895123))

(assert (=> b!967051 m!895119))

(declare-fun m!895125 () Bool)

(assert (=> b!967051 m!895125))

(declare-fun m!895127 () Bool)

(assert (=> b!967051 m!895127))

(assert (=> b!967049 m!895119))

(assert (=> b!967049 m!895119))

(declare-fun m!895129 () Bool)

(assert (=> b!967049 m!895129))

(declare-fun m!895131 () Bool)

(assert (=> start!82882 m!895131))

(declare-fun m!895133 () Bool)

(assert (=> start!82882 m!895133))

(declare-fun m!895135 () Bool)

(assert (=> start!82882 m!895135))

(check-sat (not b!967045) (not mapNonEmpty!34747) tp_is_empty!21835 b_and!30489 (not b!967049) (not start!82882) (not b!967047) (not b!967051) (not b_next!19027) (not b!967046))
(check-sat b_and!30489 (not b_next!19027))
