; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35892 () Bool)

(assert start!35892)

(declare-fun b!360820 () Bool)

(declare-fun res!200729 () Bool)

(declare-fun e!220879 () Bool)

(assert (=> b!360820 (=> (not res!200729) (not e!220879))))

(declare-datatypes ((array!20211 0))(
  ( (array!20212 (arr!9598 (Array (_ BitVec 32) (_ BitVec 64))) (size!9950 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20211)

(declare-datatypes ((List!5495 0))(
  ( (Nil!5492) (Cons!5491 (h!6347 (_ BitVec 64)) (t!10645 List!5495)) )
))
(declare-fun arrayNoDuplicates!0 (array!20211 (_ BitVec 32) List!5495) Bool)

(assert (=> b!360820 (= res!200729 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5492))))

(declare-fun b!360821 () Bool)

(declare-fun e!220881 () Bool)

(declare-fun tp_is_empty!8329 () Bool)

(assert (=> b!360821 (= e!220881 tp_is_empty!8329)))

(declare-fun b!360822 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360822 (= e!220879 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9950 _keys!1456)) (bvslt (bvsub (size!9950 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) (bvsub (size!9950 _keys!1456) from!1805)))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360822 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12083 0))(
  ( (V!12084 (val!4209 Int)) )
))
(declare-fun minValue!1150 () V!12083)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11098 0))(
  ( (Unit!11099) )
))
(declare-fun lt!166493 () Unit!11098)

(declare-datatypes ((ValueCell!3821 0))(
  ( (ValueCellFull!3821 (v!6403 V!12083)) (EmptyCell!3821) )
))
(declare-datatypes ((array!20213 0))(
  ( (array!20214 (arr!9599 (Array (_ BitVec 32) ValueCell!3821)) (size!9951 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20213)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12083)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!64 (array!20211 array!20213 (_ BitVec 32) (_ BitVec 32) V!12083 V!12083 (_ BitVec 64) (_ BitVec 32)) Unit!11098)

(assert (=> b!360822 (= lt!166493 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!64 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360823 () Bool)

(declare-fun res!200725 () Bool)

(assert (=> b!360823 (=> (not res!200725) (not e!220879))))

(assert (=> b!360823 (= res!200725 (and (= (size!9951 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9950 _keys!1456) (size!9951 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360824 () Bool)

(declare-fun res!200726 () Bool)

(assert (=> b!360824 (=> (not res!200726) (not e!220879))))

(assert (=> b!360824 (= res!200726 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!360825 () Bool)

(declare-fun e!220882 () Bool)

(declare-fun e!220878 () Bool)

(declare-fun mapRes!14004 () Bool)

(assert (=> b!360825 (= e!220882 (and e!220878 mapRes!14004))))

(declare-fun condMapEmpty!14004 () Bool)

(declare-fun mapDefault!14004 () ValueCell!3821)

