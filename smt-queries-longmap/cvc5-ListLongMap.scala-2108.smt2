; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35816 () Bool)

(assert start!35816)

(declare-fun res!199982 () Bool)

(declare-fun e!220395 () Bool)

(assert (=> start!35816 (=> (not res!199982) (not e!220395))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35816 (= res!199982 (validMask!0 mask!1842))))

(assert (=> start!35816 e!220395))

(declare-fun tp_is_empty!8269 () Bool)

(assert (=> start!35816 tp_is_empty!8269))

(assert (=> start!35816 true))

(declare-datatypes ((array!20091 0))(
  ( (array!20092 (arr!9539 (Array (_ BitVec 32) (_ BitVec 64))) (size!9891 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20091)

(declare-fun array_inv!7016 (array!20091) Bool)

(assert (=> start!35816 (array_inv!7016 _keys!1456)))

(declare-datatypes ((V!12003 0))(
  ( (V!12004 (val!4179 Int)) )
))
(declare-datatypes ((ValueCell!3791 0))(
  ( (ValueCellFull!3791 (v!6373 V!12003)) (EmptyCell!3791) )
))
(declare-datatypes ((array!20093 0))(
  ( (array!20094 (arr!9540 (Array (_ BitVec 32) ValueCell!3791)) (size!9892 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20093)

(declare-fun e!220393 () Bool)

(declare-fun array_inv!7017 (array!20093) Bool)

(assert (=> start!35816 (and (array_inv!7017 _values!1208) e!220393)))

(declare-fun mapNonEmpty!13911 () Bool)

(declare-fun mapRes!13911 () Bool)

(declare-fun tp!27978 () Bool)

(declare-fun e!220397 () Bool)

(assert (=> mapNonEmpty!13911 (= mapRes!13911 (and tp!27978 e!220397))))

(declare-fun mapKey!13911 () (_ BitVec 32))

(declare-fun mapValue!13911 () ValueCell!3791)

(declare-fun mapRest!13911 () (Array (_ BitVec 32) ValueCell!3791))

(assert (=> mapNonEmpty!13911 (= (arr!9540 _values!1208) (store mapRest!13911 mapKey!13911 mapValue!13911))))

(declare-fun b!359787 () Bool)

(declare-fun res!199984 () Bool)

(assert (=> b!359787 (=> (not res!199984) (not e!220395))))

(declare-datatypes ((List!5479 0))(
  ( (Nil!5476) (Cons!5475 (h!6331 (_ BitVec 64)) (t!10629 List!5479)) )
))
(declare-fun arrayNoDuplicates!0 (array!20091 (_ BitVec 32) List!5479) Bool)

(assert (=> b!359787 (= res!199984 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5476))))

(declare-fun b!359788 () Bool)

(assert (=> b!359788 (= e!220397 tp_is_empty!8269)))

(declare-fun b!359789 () Bool)

(assert (=> b!359789 (= e!220395 (not true))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359789 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12003)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12003)

(declare-datatypes ((Unit!11060 0))(
  ( (Unit!11061) )
))
(declare-fun lt!166391 () Unit!11060)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 (array!20091 array!20093 (_ BitVec 32) (_ BitVec 32) V!12003 V!12003 (_ BitVec 64) (_ BitVec 32)) Unit!11060)

(assert (=> b!359789 (= lt!166391 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!359790 () Bool)

(declare-fun res!199981 () Bool)

(assert (=> b!359790 (=> (not res!199981) (not e!220395))))

(assert (=> b!359790 (= res!199981 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!359791 () Bool)

(declare-fun res!199985 () Bool)

(assert (=> b!359791 (=> (not res!199985) (not e!220395))))

(assert (=> b!359791 (= res!199985 (and (= (size!9892 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9891 _keys!1456) (size!9892 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359792 () Bool)

(declare-fun res!199983 () Bool)

(assert (=> b!359792 (=> (not res!199983) (not e!220395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359792 (= res!199983 (validKeyInArray!0 k!1077))))

(declare-fun b!359793 () Bool)

(declare-fun e!220396 () Bool)

(assert (=> b!359793 (= e!220396 tp_is_empty!8269)))

(declare-fun b!359794 () Bool)

(declare-fun res!199980 () Bool)

(assert (=> b!359794 (=> (not res!199980) (not e!220395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20091 (_ BitVec 32)) Bool)

(assert (=> b!359794 (= res!199980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359795 () Bool)

(declare-fun res!199987 () Bool)

(assert (=> b!359795 (=> (not res!199987) (not e!220395))))

(assert (=> b!359795 (= res!199987 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9891 _keys!1456))))))

(declare-fun b!359796 () Bool)

(declare-fun res!199986 () Bool)

(assert (=> b!359796 (=> (not res!199986) (not e!220395))))

(assert (=> b!359796 (= res!199986 (not (= (select (arr!9539 _keys!1456) from!1805) k!1077)))))

(declare-fun b!359797 () Bool)

(assert (=> b!359797 (= e!220393 (and e!220396 mapRes!13911))))

(declare-fun condMapEmpty!13911 () Bool)

(declare-fun mapDefault!13911 () ValueCell!3791)

