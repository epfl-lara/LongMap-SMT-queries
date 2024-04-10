; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35408 () Bool)

(assert start!35408)

(declare-fun b!354458 () Bool)

(declare-fun e!217252 () Bool)

(assert (=> b!354458 (= e!217252 false)))

(declare-fun lt!165707 () Bool)

(declare-datatypes ((array!19305 0))(
  ( (array!19306 (arr!9146 (Array (_ BitVec 32) (_ BitVec 64))) (size!9498 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19305)

(declare-datatypes ((List!5297 0))(
  ( (Nil!5294) (Cons!5293 (h!6149 (_ BitVec 64)) (t!10447 List!5297)) )
))
(declare-fun arrayNoDuplicates!0 (array!19305 (_ BitVec 32) List!5297) Bool)

(assert (=> b!354458 (= lt!165707 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5294))))

(declare-fun mapIsEmpty!13299 () Bool)

(declare-fun mapRes!13299 () Bool)

(assert (=> mapIsEmpty!13299 mapRes!13299))

(declare-fun b!354459 () Bool)

(declare-fun e!217256 () Bool)

(declare-fun tp_is_empty!7861 () Bool)

(assert (=> b!354459 (= e!217256 tp_is_empty!7861)))

(declare-fun b!354460 () Bool)

(declare-fun e!217253 () Bool)

(assert (=> b!354460 (= e!217253 tp_is_empty!7861)))

(declare-fun res!196488 () Bool)

(assert (=> start!35408 (=> (not res!196488) (not e!217252))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35408 (= res!196488 (validMask!0 mask!1842))))

(assert (=> start!35408 e!217252))

(assert (=> start!35408 true))

(declare-datatypes ((V!11459 0))(
  ( (V!11460 (val!3975 Int)) )
))
(declare-datatypes ((ValueCell!3587 0))(
  ( (ValueCellFull!3587 (v!6169 V!11459)) (EmptyCell!3587) )
))
(declare-datatypes ((array!19307 0))(
  ( (array!19308 (arr!9147 (Array (_ BitVec 32) ValueCell!3587)) (size!9499 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19307)

(declare-fun e!217255 () Bool)

(declare-fun array_inv!6726 (array!19307) Bool)

(assert (=> start!35408 (and (array_inv!6726 _values!1208) e!217255)))

(declare-fun array_inv!6727 (array!19305) Bool)

(assert (=> start!35408 (array_inv!6727 _keys!1456)))

(declare-fun b!354461 () Bool)

(assert (=> b!354461 (= e!217255 (and e!217253 mapRes!13299))))

(declare-fun condMapEmpty!13299 () Bool)

(declare-fun mapDefault!13299 () ValueCell!3587)

