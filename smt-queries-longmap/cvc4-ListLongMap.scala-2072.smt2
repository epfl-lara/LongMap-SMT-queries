; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35604 () Bool)

(assert start!35604)

(declare-fun b!357153 () Bool)

(declare-fun res!198302 () Bool)

(declare-fun e!218725 () Bool)

(assert (=> b!357153 (=> (not res!198302) (not e!218725))))

(declare-datatypes ((array!19681 0))(
  ( (array!19682 (arr!9334 (Array (_ BitVec 32) (_ BitVec 64))) (size!9686 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19681)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357153 (= res!198302 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357154 () Bool)

(assert (=> b!357154 (= e!218725 (not true))))

(assert (=> b!357154 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11719 0))(
  ( (V!11720 (val!4073 Int)) )
))
(declare-fun minValue!1150 () V!11719)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11004 0))(
  ( (Unit!11005) )
))
(declare-fun lt!166001 () Unit!11004)

(declare-datatypes ((ValueCell!3685 0))(
  ( (ValueCellFull!3685 (v!6267 V!11719)) (EmptyCell!3685) )
))
(declare-datatypes ((array!19683 0))(
  ( (array!19684 (arr!9335 (Array (_ BitVec 32) ValueCell!3685)) (size!9687 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19683)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11719)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!21 (array!19681 array!19683 (_ BitVec 32) (_ BitVec 32) V!11719 V!11719 (_ BitVec 64) (_ BitVec 32)) Unit!11004)

(assert (=> b!357154 (= lt!166001 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!21 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357155 () Bool)

(declare-fun res!198306 () Bool)

(assert (=> b!357155 (=> (not res!198306) (not e!218725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19681 (_ BitVec 32)) Bool)

(assert (=> b!357155 (= res!198306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357156 () Bool)

(declare-fun e!218726 () Bool)

(declare-fun tp_is_empty!8057 () Bool)

(assert (=> b!357156 (= e!218726 tp_is_empty!8057)))

(declare-fun mapIsEmpty!13593 () Bool)

(declare-fun mapRes!13593 () Bool)

(assert (=> mapIsEmpty!13593 mapRes!13593))

(declare-fun b!357158 () Bool)

(declare-fun res!198303 () Bool)

(assert (=> b!357158 (=> (not res!198303) (not e!218725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357158 (= res!198303 (validKeyInArray!0 k!1077))))

(declare-fun mapNonEmpty!13593 () Bool)

(declare-fun tp!27570 () Bool)

(assert (=> mapNonEmpty!13593 (= mapRes!13593 (and tp!27570 e!218726))))

(declare-fun mapKey!13593 () (_ BitVec 32))

(declare-fun mapValue!13593 () ValueCell!3685)

(declare-fun mapRest!13593 () (Array (_ BitVec 32) ValueCell!3685))

(assert (=> mapNonEmpty!13593 (= (arr!9335 _values!1208) (store mapRest!13593 mapKey!13593 mapValue!13593))))

(declare-fun b!357159 () Bool)

(declare-fun res!198304 () Bool)

(assert (=> b!357159 (=> (not res!198304) (not e!218725))))

(assert (=> b!357159 (= res!198304 (not (= (select (arr!9334 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357160 () Bool)

(declare-fun res!198300 () Bool)

(assert (=> b!357160 (=> (not res!198300) (not e!218725))))

(assert (=> b!357160 (= res!198300 (and (= (size!9687 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9686 _keys!1456) (size!9687 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357161 () Bool)

(declare-fun res!198307 () Bool)

(assert (=> b!357161 (=> (not res!198307) (not e!218725))))

(assert (=> b!357161 (= res!198307 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9686 _keys!1456))))))

(declare-fun b!357162 () Bool)

(declare-fun res!198305 () Bool)

(assert (=> b!357162 (=> (not res!198305) (not e!218725))))

(declare-datatypes ((List!5386 0))(
  ( (Nil!5383) (Cons!5382 (h!6238 (_ BitVec 64)) (t!10536 List!5386)) )
))
(declare-fun arrayNoDuplicates!0 (array!19681 (_ BitVec 32) List!5386) Bool)

(assert (=> b!357162 (= res!198305 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5383))))

(declare-fun b!357163 () Bool)

(declare-fun e!218724 () Bool)

(declare-fun e!218723 () Bool)

(assert (=> b!357163 (= e!218724 (and e!218723 mapRes!13593))))

(declare-fun condMapEmpty!13593 () Bool)

(declare-fun mapDefault!13593 () ValueCell!3685)

