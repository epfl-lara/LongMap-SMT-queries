; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34706 () Bool)

(assert start!34706)

(declare-fun b_free!7513 () Bool)

(declare-fun b_next!7513 () Bool)

(assert (=> start!34706 (= b_free!7513 (not b_next!7513))))

(declare-fun tp!26103 () Bool)

(declare-fun b_and!14733 () Bool)

(assert (=> start!34706 (= tp!26103 b_and!14733)))

(declare-fun b!346880 () Bool)

(declare-fun res!191930 () Bool)

(declare-fun e!212575 () Bool)

(assert (=> b!346880 (=> (not res!191930) (not e!212575))))

(declare-datatypes ((array!18523 0))(
  ( (array!18524 (arr!8772 (Array (_ BitVec 32) (_ BitVec 64))) (size!9124 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18523)

(declare-datatypes ((List!5090 0))(
  ( (Nil!5087) (Cons!5086 (h!5942 (_ BitVec 64)) (t!10218 List!5090)) )
))
(declare-fun arrayNoDuplicates!0 (array!18523 (_ BitVec 32) List!5090) Bool)

(assert (=> b!346880 (= res!191930 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5087))))

(declare-fun mapIsEmpty!12654 () Bool)

(declare-fun mapRes!12654 () Bool)

(assert (=> mapIsEmpty!12654 mapRes!12654))

(declare-fun b!346881 () Bool)

(declare-fun res!191925 () Bool)

(assert (=> b!346881 (=> (not res!191925) (not e!212575))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10931 0))(
  ( (V!10932 (val!3777 Int)) )
))
(declare-fun zeroValue!1467 () V!10931)

(declare-datatypes ((ValueCell!3389 0))(
  ( (ValueCellFull!3389 (v!5959 V!10931)) (EmptyCell!3389) )
))
(declare-datatypes ((array!18525 0))(
  ( (array!18526 (arr!8773 (Array (_ BitVec 32) ValueCell!3389)) (size!9125 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18525)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10931)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5468 0))(
  ( (tuple2!5469 (_1!2745 (_ BitVec 64)) (_2!2745 V!10931)) )
))
(declare-datatypes ((List!5091 0))(
  ( (Nil!5088) (Cons!5087 (h!5943 tuple2!5468) (t!10219 List!5091)) )
))
(declare-datatypes ((ListLongMap!4381 0))(
  ( (ListLongMap!4382 (toList!2206 List!5091)) )
))
(declare-fun contains!2270 (ListLongMap!4381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1727 (array!18523 array!18525 (_ BitVec 32) (_ BitVec 32) V!10931 V!10931 (_ BitVec 32) Int) ListLongMap!4381)

(assert (=> b!346881 (= res!191925 (not (contains!2270 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346882 () Bool)

(declare-fun res!191928 () Bool)

(assert (=> b!346882 (=> (not res!191928) (not e!212575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346882 (= res!191928 (validKeyInArray!0 k!1348))))

(declare-fun b!346883 () Bool)

(declare-fun res!191924 () Bool)

(assert (=> b!346883 (=> (not res!191924) (not e!212575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18523 (_ BitVec 32)) Bool)

(assert (=> b!346883 (= res!191924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346884 () Bool)

(declare-fun res!191927 () Bool)

(declare-fun e!212580 () Bool)

(assert (=> b!346884 (=> (not res!191927) (not e!212580))))

(declare-datatypes ((SeekEntryResult!3385 0))(
  ( (MissingZero!3385 (index!15719 (_ BitVec 32))) (Found!3385 (index!15720 (_ BitVec 32))) (Intermediate!3385 (undefined!4197 Bool) (index!15721 (_ BitVec 32)) (x!34559 (_ BitVec 32))) (Undefined!3385) (MissingVacant!3385 (index!15722 (_ BitVec 32))) )
))
(declare-fun lt!163449 () SeekEntryResult!3385)

(declare-fun arrayContainsKey!0 (array!18523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346884 (= res!191927 (arrayContainsKey!0 _keys!1895 k!1348 (index!15720 lt!163449)))))

(declare-fun b!346885 () Bool)

(declare-fun e!212578 () Bool)

(declare-fun tp_is_empty!7465 () Bool)

(assert (=> b!346885 (= e!212578 tp_is_empty!7465)))

(declare-fun b!346886 () Bool)

(declare-fun e!212579 () Bool)

(assert (=> b!346886 (= e!212579 (and e!212578 mapRes!12654))))

(declare-fun condMapEmpty!12654 () Bool)

(declare-fun mapDefault!12654 () ValueCell!3389)

