; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35594 () Bool)

(assert start!35594)

(declare-fun b!356988 () Bool)

(declare-fun e!218650 () Bool)

(declare-fun tp_is_empty!8047 () Bool)

(assert (=> b!356988 (= e!218650 tp_is_empty!8047)))

(declare-fun mapIsEmpty!13578 () Bool)

(declare-fun mapRes!13578 () Bool)

(assert (=> mapIsEmpty!13578 mapRes!13578))

(declare-fun b!356989 () Bool)

(declare-fun res!198185 () Bool)

(declare-fun e!218647 () Bool)

(assert (=> b!356989 (=> (not res!198185) (not e!218647))))

(declare-datatypes ((array!19661 0))(
  ( (array!19662 (arr!9324 (Array (_ BitVec 32) (_ BitVec 64))) (size!9676 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19661)

(declare-datatypes ((List!5382 0))(
  ( (Nil!5379) (Cons!5378 (h!6234 (_ BitVec 64)) (t!10532 List!5382)) )
))
(declare-fun arrayNoDuplicates!0 (array!19661 (_ BitVec 32) List!5382) Bool)

(assert (=> b!356989 (= res!198185 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5379))))

(declare-fun b!356990 () Bool)

(declare-fun res!198186 () Bool)

(assert (=> b!356990 (=> (not res!198186) (not e!218647))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19661 (_ BitVec 32)) Bool)

(assert (=> b!356990 (= res!198186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356991 () Bool)

(declare-fun res!198180 () Bool)

(assert (=> b!356991 (=> (not res!198180) (not e!218647))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356991 (= res!198180 (validKeyInArray!0 k!1077))))

(declare-fun b!356993 () Bool)

(declare-fun res!198183 () Bool)

(assert (=> b!356993 (=> (not res!198183) (not e!218647))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356993 (= res!198183 (not (= (select (arr!9324 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356994 () Bool)

(declare-fun res!198182 () Bool)

(assert (=> b!356994 (=> (not res!198182) (not e!218647))))

(assert (=> b!356994 (= res!198182 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9676 _keys!1456))))))

(declare-fun mapNonEmpty!13578 () Bool)

(declare-fun tp!27555 () Bool)

(assert (=> mapNonEmpty!13578 (= mapRes!13578 (and tp!27555 e!218650))))

(declare-fun mapKey!13578 () (_ BitVec 32))

(declare-datatypes ((V!11707 0))(
  ( (V!11708 (val!4068 Int)) )
))
(declare-datatypes ((ValueCell!3680 0))(
  ( (ValueCellFull!3680 (v!6262 V!11707)) (EmptyCell!3680) )
))
(declare-fun mapValue!13578 () ValueCell!3680)

(declare-fun mapRest!13578 () (Array (_ BitVec 32) ValueCell!3680))

(declare-datatypes ((array!19663 0))(
  ( (array!19664 (arr!9325 (Array (_ BitVec 32) ValueCell!3680)) (size!9677 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19663)

(assert (=> mapNonEmpty!13578 (= (arr!9325 _values!1208) (store mapRest!13578 mapKey!13578 mapValue!13578))))

(declare-fun b!356995 () Bool)

(assert (=> b!356995 (= e!218647 (not true))))

(declare-fun arrayContainsKey!0 (array!19661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356995 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11707)

(declare-datatypes ((Unit!10994 0))(
  ( (Unit!10995) )
))
(declare-fun lt!165986 () Unit!10994)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11707)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!16 (array!19661 array!19663 (_ BitVec 32) (_ BitVec 32) V!11707 V!11707 (_ BitVec 64) (_ BitVec 32)) Unit!10994)

(assert (=> b!356995 (= lt!165986 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!16 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356996 () Bool)

(declare-fun e!218651 () Bool)

(declare-fun e!218648 () Bool)

(assert (=> b!356996 (= e!218651 (and e!218648 mapRes!13578))))

(declare-fun condMapEmpty!13578 () Bool)

(declare-fun mapDefault!13578 () ValueCell!3680)

