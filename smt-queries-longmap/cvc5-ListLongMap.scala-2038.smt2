; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35396 () Bool)

(assert start!35396)

(declare-fun b!354350 () Bool)

(declare-fun res!196433 () Bool)

(declare-fun e!217166 () Bool)

(assert (=> b!354350 (=> (not res!196433) (not e!217166))))

(declare-datatypes ((array!19283 0))(
  ( (array!19284 (arr!9135 (Array (_ BitVec 32) (_ BitVec 64))) (size!9487 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19283)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19283 (_ BitVec 32)) Bool)

(assert (=> b!354350 (= res!196433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354351 () Bool)

(declare-fun e!217163 () Bool)

(declare-fun e!217164 () Bool)

(declare-fun mapRes!13281 () Bool)

(assert (=> b!354351 (= e!217163 (and e!217164 mapRes!13281))))

(declare-fun condMapEmpty!13281 () Bool)

(declare-datatypes ((V!11443 0))(
  ( (V!11444 (val!3969 Int)) )
))
(declare-datatypes ((ValueCell!3581 0))(
  ( (ValueCellFull!3581 (v!6163 V!11443)) (EmptyCell!3581) )
))
(declare-datatypes ((array!19285 0))(
  ( (array!19286 (arr!9136 (Array (_ BitVec 32) ValueCell!3581)) (size!9488 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19285)

(declare-fun mapDefault!13281 () ValueCell!3581)

