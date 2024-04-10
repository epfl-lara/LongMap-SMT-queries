; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35612 () Bool)

(assert start!35612)

(declare-fun b_free!7867 () Bool)

(declare-fun b_next!7867 () Bool)

(assert (=> start!35612 (= b_free!7867 (not b_next!7867))))

(declare-fun tp!27585 () Bool)

(declare-fun b_and!15109 () Bool)

(assert (=> start!35612 (= tp!27585 b_and!15109)))

(declare-fun mapIsEmpty!13605 () Bool)

(declare-fun mapRes!13605 () Bool)

(assert (=> mapIsEmpty!13605 mapRes!13605))

(declare-fun b!357287 () Bool)

(declare-fun res!198406 () Bool)

(declare-fun e!218784 () Bool)

(assert (=> b!357287 (=> (not res!198406) (not e!218784))))

(declare-datatypes ((array!19697 0))(
  ( (array!19698 (arr!9342 (Array (_ BitVec 32) (_ BitVec 64))) (size!9694 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19697)

(declare-datatypes ((List!5389 0))(
  ( (Nil!5386) (Cons!5385 (h!6241 (_ BitVec 64)) (t!10539 List!5389)) )
))
(declare-fun arrayNoDuplicates!0 (array!19697 (_ BitVec 32) List!5389) Bool)

(assert (=> b!357287 (= res!198406 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5386))))

(declare-fun b!357288 () Bool)

(declare-fun e!218789 () Bool)

(assert (=> b!357288 (= e!218784 (not e!218789))))

(declare-fun res!198398 () Bool)

(assert (=> b!357288 (=> res!198398 e!218789)))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357288 (= res!198398 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9694 _keys!1456))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357288 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11731 0))(
  ( (V!11732 (val!4077 Int)) )
))
(declare-fun minValue!1150 () V!11731)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11008 0))(
  ( (Unit!11009) )
))
(declare-fun lt!166016 () Unit!11008)

(declare-datatypes ((ValueCell!3689 0))(
  ( (ValueCellFull!3689 (v!6271 V!11731)) (EmptyCell!3689) )
))
(declare-datatypes ((array!19699 0))(
  ( (array!19700 (arr!9343 (Array (_ BitVec 32) ValueCell!3689)) (size!9695 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19699)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11731)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!23 (array!19697 array!19699 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 64) (_ BitVec 32)) Unit!11008)

(assert (=> b!357288 (= lt!166016 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!23 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357289 () Bool)

(declare-fun res!198399 () Bool)

(assert (=> b!357289 (=> (not res!198399) (not e!218784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357289 (= res!198399 (validKeyInArray!0 k!1077))))

(declare-fun b!357290 () Bool)

(declare-fun res!198404 () Bool)

(assert (=> b!357290 (=> (not res!198404) (not e!218784))))

(assert (=> b!357290 (= res!198404 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9694 _keys!1456))))))

(declare-fun b!357291 () Bool)

(declare-fun res!198401 () Bool)

(assert (=> b!357291 (=> (not res!198401) (not e!218784))))

(assert (=> b!357291 (= res!198401 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!198402 () Bool)

(assert (=> start!35612 (=> (not res!198402) (not e!218784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35612 (= res!198402 (validMask!0 mask!1842))))

(assert (=> start!35612 e!218784))

(declare-fun tp_is_empty!8065 () Bool)

(assert (=> start!35612 tp_is_empty!8065))

(assert (=> start!35612 true))

(assert (=> start!35612 tp!27585))

(declare-fun array_inv!6866 (array!19697) Bool)

(assert (=> start!35612 (array_inv!6866 _keys!1456)))

(declare-fun e!218788 () Bool)

(declare-fun array_inv!6867 (array!19699) Bool)

(assert (=> start!35612 (and (array_inv!6867 _values!1208) e!218788)))

(declare-fun b!357292 () Bool)

(declare-fun e!218786 () Bool)

(assert (=> b!357292 (= e!218788 (and e!218786 mapRes!13605))))

(declare-fun condMapEmpty!13605 () Bool)

(declare-fun mapDefault!13605 () ValueCell!3689)

