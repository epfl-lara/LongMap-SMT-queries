; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20046 () Bool)

(assert start!20046)

(declare-fun mapIsEmpty!7910 () Bool)

(declare-fun mapRes!7910 () Bool)

(assert (=> mapIsEmpty!7910 mapRes!7910))

(declare-fun b!196305 () Bool)

(declare-fun res!92650 () Bool)

(declare-fun e!129267 () Bool)

(assert (=> b!196305 (=> (not res!92650) (not e!129267))))

(declare-datatypes ((array!8381 0))(
  ( (array!8382 (arr!3941 (Array (_ BitVec 32) (_ BitVec 64))) (size!4266 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8381)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8381 (_ BitVec 32)) Bool)

(assert (=> b!196305 (= res!92650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196306 () Bool)

(declare-fun e!129268 () Bool)

(declare-fun tp_is_empty!4561 () Bool)

(assert (=> b!196306 (= e!129268 tp_is_empty!4561)))

(declare-fun b!196307 () Bool)

(declare-fun res!92649 () Bool)

(assert (=> b!196307 (=> (not res!92649) (not e!129267))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5729 0))(
  ( (V!5730 (val!2325 Int)) )
))
(declare-datatypes ((ValueCell!1937 0))(
  ( (ValueCellFull!1937 (v!4295 V!5729)) (EmptyCell!1937) )
))
(declare-datatypes ((array!8383 0))(
  ( (array!8384 (arr!3942 (Array (_ BitVec 32) ValueCell!1937)) (size!4267 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8383)

(assert (=> b!196307 (= res!92649 (and (= (size!4267 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4266 _keys!825) (size!4267 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7910 () Bool)

(declare-fun tp!17198 () Bool)

(declare-fun e!129269 () Bool)

(assert (=> mapNonEmpty!7910 (= mapRes!7910 (and tp!17198 e!129269))))

(declare-fun mapRest!7910 () (Array (_ BitVec 32) ValueCell!1937))

(declare-fun mapValue!7910 () ValueCell!1937)

(declare-fun mapKey!7910 () (_ BitVec 32))

(assert (=> mapNonEmpty!7910 (= (arr!3942 _values!649) (store mapRest!7910 mapKey!7910 mapValue!7910))))

(declare-fun b!196308 () Bool)

(assert (=> b!196308 (= e!129267 false)))

(declare-fun lt!97596 () Bool)

(declare-datatypes ((List!2467 0))(
  ( (Nil!2464) (Cons!2463 (h!3105 (_ BitVec 64)) (t!7398 List!2467)) )
))
(declare-fun arrayNoDuplicates!0 (array!8381 (_ BitVec 32) List!2467) Bool)

(assert (=> b!196308 (= lt!97596 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2464))))

(declare-fun res!92648 () Bool)

(assert (=> start!20046 (=> (not res!92648) (not e!129267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20046 (= res!92648 (validMask!0 mask!1149))))

(assert (=> start!20046 e!129267))

(assert (=> start!20046 true))

(declare-fun e!129266 () Bool)

(declare-fun array_inv!2561 (array!8383) Bool)

(assert (=> start!20046 (and (array_inv!2561 _values!649) e!129266)))

(declare-fun array_inv!2562 (array!8381) Bool)

(assert (=> start!20046 (array_inv!2562 _keys!825)))

(declare-fun b!196309 () Bool)

(assert (=> b!196309 (= e!129269 tp_is_empty!4561)))

(declare-fun b!196310 () Bool)

(assert (=> b!196310 (= e!129266 (and e!129268 mapRes!7910))))

(declare-fun condMapEmpty!7910 () Bool)

(declare-fun mapDefault!7910 () ValueCell!1937)

