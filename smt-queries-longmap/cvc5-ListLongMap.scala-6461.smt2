; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82606 () Bool)

(assert start!82606)

(declare-fun b_free!18739 () Bool)

(declare-fun b_next!18739 () Bool)

(assert (=> start!82606 (= b_free!18739 (not b_next!18739))))

(declare-fun tp!65336 () Bool)

(declare-fun b_and!30227 () Bool)

(assert (=> start!82606 (= tp!65336 b_and!30227)))

(declare-fun b!962766 () Bool)

(declare-fun e!542927 () Bool)

(declare-fun tp_is_empty!21541 () Bool)

(assert (=> b!962766 (= e!542927 tp_is_empty!21541)))

(declare-fun b!962767 () Bool)

(declare-fun res!644305 () Bool)

(declare-fun e!542930 () Bool)

(assert (=> b!962767 (=> (not res!644305) (not e!542930))))

(declare-datatypes ((array!59177 0))(
  ( (array!59178 (arr!28457 (Array (_ BitVec 32) (_ BitVec 64))) (size!28936 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59177)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962767 (= res!644305 (validKeyInArray!0 (select (arr!28457 _keys!1686) i!803)))))

(declare-fun b!962768 () Bool)

(declare-fun res!644309 () Bool)

(assert (=> b!962768 (=> (not res!644309) (not e!542930))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962768 (= res!644309 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28936 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28936 _keys!1686))))))

(declare-fun b!962769 () Bool)

(declare-fun res!644310 () Bool)

(assert (=> b!962769 (=> (not res!644310) (not e!542930))))

(assert (=> b!962769 (= res!644310 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962770 () Bool)

(declare-fun e!542928 () Bool)

(assert (=> b!962770 (= e!542928 tp_is_empty!21541)))

(declare-fun mapIsEmpty!34306 () Bool)

(declare-fun mapRes!34306 () Bool)

(assert (=> mapIsEmpty!34306 mapRes!34306))

(declare-fun b!962772 () Bool)

(declare-fun res!644311 () Bool)

(assert (=> b!962772 (=> (not res!644311) (not e!542930))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33705 0))(
  ( (V!33706 (val!10821 Int)) )
))
(declare-datatypes ((ValueCell!10289 0))(
  ( (ValueCellFull!10289 (v!13379 V!33705)) (EmptyCell!10289) )
))
(declare-datatypes ((array!59179 0))(
  ( (array!59180 (arr!28458 (Array (_ BitVec 32) ValueCell!10289)) (size!28937 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59179)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962772 (= res!644311 (and (= (size!28937 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28936 _keys!1686) (size!28937 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962773 () Bool)

(declare-fun res!644307 () Bool)

(assert (=> b!962773 (=> (not res!644307) (not e!542930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59177 (_ BitVec 32)) Bool)

(assert (=> b!962773 (= res!644307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34306 () Bool)

(declare-fun tp!65337 () Bool)

(assert (=> mapNonEmpty!34306 (= mapRes!34306 (and tp!65337 e!542928))))

(declare-fun mapKey!34306 () (_ BitVec 32))

(declare-fun mapRest!34306 () (Array (_ BitVec 32) ValueCell!10289))

(declare-fun mapValue!34306 () ValueCell!10289)

(assert (=> mapNonEmpty!34306 (= (arr!28458 _values!1400) (store mapRest!34306 mapKey!34306 mapValue!34306))))

(declare-fun b!962774 () Bool)

(declare-fun res!644306 () Bool)

(assert (=> b!962774 (=> (not res!644306) (not e!542930))))

(declare-fun minValue!1342 () V!33705)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33705)

(declare-datatypes ((tuple2!13900 0))(
  ( (tuple2!13901 (_1!6961 (_ BitVec 64)) (_2!6961 V!33705)) )
))
(declare-datatypes ((List!19749 0))(
  ( (Nil!19746) (Cons!19745 (h!20907 tuple2!13900) (t!28112 List!19749)) )
))
(declare-datatypes ((ListLongMap!12597 0))(
  ( (ListLongMap!12598 (toList!6314 List!19749)) )
))
(declare-fun contains!5417 (ListLongMap!12597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3547 (array!59177 array!59179 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) Int) ListLongMap!12597)

(assert (=> b!962774 (= res!644306 (contains!5417 (getCurrentListMap!3547 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28457 _keys!1686) i!803)))))

(declare-fun b!962775 () Bool)

(assert (=> b!962775 (= e!542930 (not true))))

(assert (=> b!962775 (contains!5417 (getCurrentListMap!3547 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28457 _keys!1686) i!803))))

(declare-datatypes ((Unit!32213 0))(
  ( (Unit!32214) )
))
(declare-fun lt!430912 () Unit!32213)

(declare-fun lemmaInListMapFromThenInFromMinusOne!1 (array!59177 array!59179 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) (_ BitVec 32) Int) Unit!32213)

(assert (=> b!962775 (= lt!430912 (lemmaInListMapFromThenInFromMinusOne!1 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962776 () Bool)

(declare-fun res!644308 () Bool)

(assert (=> b!962776 (=> (not res!644308) (not e!542930))))

(declare-datatypes ((List!19750 0))(
  ( (Nil!19747) (Cons!19746 (h!20908 (_ BitVec 64)) (t!28113 List!19750)) )
))
(declare-fun arrayNoDuplicates!0 (array!59177 (_ BitVec 32) List!19750) Bool)

(assert (=> b!962776 (= res!644308 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19747))))

(declare-fun res!644304 () Bool)

(assert (=> start!82606 (=> (not res!644304) (not e!542930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82606 (= res!644304 (validMask!0 mask!2110))))

(assert (=> start!82606 e!542930))

(assert (=> start!82606 true))

(declare-fun e!542929 () Bool)

(declare-fun array_inv!22049 (array!59179) Bool)

(assert (=> start!82606 (and (array_inv!22049 _values!1400) e!542929)))

(declare-fun array_inv!22050 (array!59177) Bool)

(assert (=> start!82606 (array_inv!22050 _keys!1686)))

(assert (=> start!82606 tp!65336))

(assert (=> start!82606 tp_is_empty!21541))

(declare-fun b!962771 () Bool)

(assert (=> b!962771 (= e!542929 (and e!542927 mapRes!34306))))

(declare-fun condMapEmpty!34306 () Bool)

(declare-fun mapDefault!34306 () ValueCell!10289)

