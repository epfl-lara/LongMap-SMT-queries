; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35762 () Bool)

(assert start!35762)

(declare-fun b!359246 () Bool)

(declare-fun res!199684 () Bool)

(declare-fun e!219990 () Bool)

(assert (=> b!359246 (=> (not res!199684) (not e!219990))))

(declare-datatypes ((array!19989 0))(
  ( (array!19990 (arr!9488 (Array (_ BitVec 32) (_ BitVec 64))) (size!9840 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19989)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19989 (_ BitVec 32)) Bool)

(assert (=> b!359246 (= res!199684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13830 () Bool)

(declare-fun mapRes!13830 () Bool)

(declare-fun tp!27897 () Bool)

(declare-fun e!219992 () Bool)

(assert (=> mapNonEmpty!13830 (= mapRes!13830 (and tp!27897 e!219992))))

(declare-fun mapKey!13830 () (_ BitVec 32))

(declare-datatypes ((V!11931 0))(
  ( (V!11932 (val!4152 Int)) )
))
(declare-datatypes ((ValueCell!3764 0))(
  ( (ValueCellFull!3764 (v!6346 V!11931)) (EmptyCell!3764) )
))
(declare-fun mapValue!13830 () ValueCell!3764)

(declare-fun mapRest!13830 () (Array (_ BitVec 32) ValueCell!3764))

(declare-datatypes ((array!19991 0))(
  ( (array!19992 (arr!9489 (Array (_ BitVec 32) ValueCell!3764)) (size!9841 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19991)

(assert (=> mapNonEmpty!13830 (= (arr!9489 _values!1208) (store mapRest!13830 mapKey!13830 mapValue!13830))))

(declare-fun b!359247 () Bool)

(assert (=> b!359247 (= e!219990 false)))

(declare-fun lt!166310 () Bool)

(declare-datatypes ((List!5460 0))(
  ( (Nil!5457) (Cons!5456 (h!6312 (_ BitVec 64)) (t!10610 List!5460)) )
))
(declare-fun arrayNoDuplicates!0 (array!19989 (_ BitVec 32) List!5460) Bool)

(assert (=> b!359247 (= lt!166310 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5457))))

(declare-fun b!359248 () Bool)

(declare-fun e!219991 () Bool)

(declare-fun e!219989 () Bool)

(assert (=> b!359248 (= e!219991 (and e!219989 mapRes!13830))))

(declare-fun condMapEmpty!13830 () Bool)

(declare-fun mapDefault!13830 () ValueCell!3764)

