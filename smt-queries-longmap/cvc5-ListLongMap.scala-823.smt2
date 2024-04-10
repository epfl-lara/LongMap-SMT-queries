; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20034 () Bool)

(assert start!20034)

(declare-fun b!196197 () Bool)

(declare-fun res!92594 () Bool)

(declare-fun e!129179 () Bool)

(assert (=> b!196197 (=> (not res!92594) (not e!129179))))

(declare-datatypes ((array!8361 0))(
  ( (array!8362 (arr!3931 (Array (_ BitVec 32) (_ BitVec 64))) (size!4256 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8361)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8361 (_ BitVec 32)) Bool)

(assert (=> b!196197 (= res!92594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196198 () Bool)

(assert (=> b!196198 (= e!129179 false)))

(declare-fun lt!97578 () Bool)

(declare-datatypes ((List!2463 0))(
  ( (Nil!2460) (Cons!2459 (h!3101 (_ BitVec 64)) (t!7394 List!2463)) )
))
(declare-fun arrayNoDuplicates!0 (array!8361 (_ BitVec 32) List!2463) Bool)

(assert (=> b!196198 (= lt!97578 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2460))))

(declare-fun b!196199 () Bool)

(declare-fun e!129178 () Bool)

(declare-fun e!129177 () Bool)

(declare-fun mapRes!7892 () Bool)

(assert (=> b!196199 (= e!129178 (and e!129177 mapRes!7892))))

(declare-fun condMapEmpty!7892 () Bool)

(declare-datatypes ((V!5713 0))(
  ( (V!5714 (val!2319 Int)) )
))
(declare-datatypes ((ValueCell!1931 0))(
  ( (ValueCellFull!1931 (v!4289 V!5713)) (EmptyCell!1931) )
))
(declare-datatypes ((array!8363 0))(
  ( (array!8364 (arr!3932 (Array (_ BitVec 32) ValueCell!1931)) (size!4257 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8363)

(declare-fun mapDefault!7892 () ValueCell!1931)

