; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35574 () Bool)

(assert start!35574)

(declare-fun b!356658 () Bool)

(declare-fun res!197944 () Bool)

(declare-fun e!218500 () Bool)

(assert (=> b!356658 (=> (not res!197944) (not e!218500))))

(declare-datatypes ((array!19623 0))(
  ( (array!19624 (arr!9305 (Array (_ BitVec 32) (_ BitVec 64))) (size!9657 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19623)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19623 (_ BitVec 32)) Bool)

(assert (=> b!356658 (= res!197944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356659 () Bool)

(declare-fun e!218501 () Bool)

(declare-fun tp_is_empty!8027 () Bool)

(assert (=> b!356659 (= e!218501 tp_is_empty!8027)))

(declare-fun b!356660 () Bool)

(declare-fun e!218497 () Bool)

(assert (=> b!356660 (= e!218497 tp_is_empty!8027)))

(declare-fun b!356661 () Bool)

(declare-fun res!197947 () Bool)

(assert (=> b!356661 (=> (not res!197947) (not e!218500))))

(declare-datatypes ((List!5375 0))(
  ( (Nil!5372) (Cons!5371 (h!6227 (_ BitVec 64)) (t!10525 List!5375)) )
))
(declare-fun arrayNoDuplicates!0 (array!19623 (_ BitVec 32) List!5375) Bool)

(assert (=> b!356661 (= res!197947 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5372))))

(declare-fun res!197941 () Bool)

(assert (=> start!35574 (=> (not res!197941) (not e!218500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35574 (= res!197941 (validMask!0 mask!1842))))

(assert (=> start!35574 e!218500))

(assert (=> start!35574 tp_is_empty!8027))

(assert (=> start!35574 true))

(declare-fun array_inv!6838 (array!19623) Bool)

(assert (=> start!35574 (array_inv!6838 _keys!1456)))

(declare-datatypes ((V!11679 0))(
  ( (V!11680 (val!4058 Int)) )
))
(declare-datatypes ((ValueCell!3670 0))(
  ( (ValueCellFull!3670 (v!6252 V!11679)) (EmptyCell!3670) )
))
(declare-datatypes ((array!19625 0))(
  ( (array!19626 (arr!9306 (Array (_ BitVec 32) ValueCell!3670)) (size!9658 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19625)

(declare-fun e!218498 () Bool)

(declare-fun array_inv!6839 (array!19625) Bool)

(assert (=> start!35574 (and (array_inv!6839 _values!1208) e!218498)))

(declare-fun b!356662 () Bool)

(declare-fun res!197945 () Bool)

(assert (=> b!356662 (=> (not res!197945) (not e!218500))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356662 (= res!197945 (validKeyInArray!0 k!1077))))

(declare-fun b!356663 () Bool)

(declare-fun res!197943 () Bool)

(assert (=> b!356663 (=> (not res!197943) (not e!218500))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356663 (= res!197943 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9657 _keys!1456))))))

(declare-fun b!356664 () Bool)

(declare-fun res!197946 () Bool)

(assert (=> b!356664 (=> (not res!197946) (not e!218500))))

(declare-fun arrayContainsKey!0 (array!19623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356664 (= res!197946 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356665 () Bool)

(declare-fun mapRes!13548 () Bool)

(assert (=> b!356665 (= e!218498 (and e!218501 mapRes!13548))))

(declare-fun condMapEmpty!13548 () Bool)

(declare-fun mapDefault!13548 () ValueCell!3670)

