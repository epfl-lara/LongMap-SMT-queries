; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35414 () Bool)

(assert start!35414)

(declare-fun b!354512 () Bool)

(declare-fun e!217301 () Bool)

(assert (=> b!354512 (= e!217301 false)))

(declare-fun lt!165716 () Bool)

(declare-datatypes ((array!19317 0))(
  ( (array!19318 (arr!9152 (Array (_ BitVec 32) (_ BitVec 64))) (size!9504 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19317)

(declare-datatypes ((List!5299 0))(
  ( (Nil!5296) (Cons!5295 (h!6151 (_ BitVec 64)) (t!10449 List!5299)) )
))
(declare-fun arrayNoDuplicates!0 (array!19317 (_ BitVec 32) List!5299) Bool)

(assert (=> b!354512 (= lt!165716 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5296))))

(declare-fun b!354513 () Bool)

(declare-fun res!196516 () Bool)

(assert (=> b!354513 (=> (not res!196516) (not e!217301))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19317 (_ BitVec 32)) Bool)

(assert (=> b!354513 (= res!196516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354514 () Bool)

(declare-fun e!217299 () Bool)

(declare-fun tp_is_empty!7867 () Bool)

(assert (=> b!354514 (= e!217299 tp_is_empty!7867)))

(declare-fun res!196514 () Bool)

(assert (=> start!35414 (=> (not res!196514) (not e!217301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35414 (= res!196514 (validMask!0 mask!1842))))

(assert (=> start!35414 e!217301))

(assert (=> start!35414 true))

(declare-datatypes ((V!11467 0))(
  ( (V!11468 (val!3978 Int)) )
))
(declare-datatypes ((ValueCell!3590 0))(
  ( (ValueCellFull!3590 (v!6172 V!11467)) (EmptyCell!3590) )
))
(declare-datatypes ((array!19319 0))(
  ( (array!19320 (arr!9153 (Array (_ BitVec 32) ValueCell!3590)) (size!9505 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19319)

(declare-fun e!217297 () Bool)

(declare-fun array_inv!6730 (array!19319) Bool)

(assert (=> start!35414 (and (array_inv!6730 _values!1208) e!217297)))

(declare-fun array_inv!6731 (array!19317) Bool)

(assert (=> start!35414 (array_inv!6731 _keys!1456)))

(declare-fun b!354515 () Bool)

(declare-fun e!217300 () Bool)

(assert (=> b!354515 (= e!217300 tp_is_empty!7867)))

(declare-fun mapNonEmpty!13308 () Bool)

(declare-fun mapRes!13308 () Bool)

(declare-fun tp!27204 () Bool)

(assert (=> mapNonEmpty!13308 (= mapRes!13308 (and tp!27204 e!217300))))

(declare-fun mapRest!13308 () (Array (_ BitVec 32) ValueCell!3590))

(declare-fun mapKey!13308 () (_ BitVec 32))

(declare-fun mapValue!13308 () ValueCell!3590)

(assert (=> mapNonEmpty!13308 (= (arr!9153 _values!1208) (store mapRest!13308 mapKey!13308 mapValue!13308))))

(declare-fun b!354516 () Bool)

(assert (=> b!354516 (= e!217297 (and e!217299 mapRes!13308))))

(declare-fun condMapEmpty!13308 () Bool)

(declare-fun mapDefault!13308 () ValueCell!3590)

