; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20062 () Bool)

(assert start!20062)

(declare-fun b!196449 () Bool)

(declare-fun e!129387 () Bool)

(assert (=> b!196449 (= e!129387 false)))

(declare-fun lt!97620 () Bool)

(declare-datatypes ((array!8411 0))(
  ( (array!8412 (arr!3956 (Array (_ BitVec 32) (_ BitVec 64))) (size!4281 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8411)

(declare-datatypes ((List!2473 0))(
  ( (Nil!2470) (Cons!2469 (h!3111 (_ BitVec 64)) (t!7404 List!2473)) )
))
(declare-fun arrayNoDuplicates!0 (array!8411 (_ BitVec 32) List!2473) Bool)

(assert (=> b!196449 (= lt!97620 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2470))))

(declare-fun b!196450 () Bool)

(declare-fun e!129389 () Bool)

(declare-fun tp_is_empty!4577 () Bool)

(assert (=> b!196450 (= e!129389 tp_is_empty!4577)))

(declare-fun b!196451 () Bool)

(declare-fun res!92721 () Bool)

(assert (=> b!196451 (=> (not res!92721) (not e!129387))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8411 (_ BitVec 32)) Bool)

(assert (=> b!196451 (= res!92721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!92722 () Bool)

(assert (=> start!20062 (=> (not res!92722) (not e!129387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20062 (= res!92722 (validMask!0 mask!1149))))

(assert (=> start!20062 e!129387))

(assert (=> start!20062 true))

(declare-datatypes ((V!5749 0))(
  ( (V!5750 (val!2333 Int)) )
))
(declare-datatypes ((ValueCell!1945 0))(
  ( (ValueCellFull!1945 (v!4303 V!5749)) (EmptyCell!1945) )
))
(declare-datatypes ((array!8413 0))(
  ( (array!8414 (arr!3957 (Array (_ BitVec 32) ValueCell!1945)) (size!4282 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8413)

(declare-fun e!129386 () Bool)

(declare-fun array_inv!2575 (array!8413) Bool)

(assert (=> start!20062 (and (array_inv!2575 _values!649) e!129386)))

(declare-fun array_inv!2576 (array!8411) Bool)

(assert (=> start!20062 (array_inv!2576 _keys!825)))

(declare-fun b!196452 () Bool)

(declare-fun e!129388 () Bool)

(declare-fun mapRes!7934 () Bool)

(assert (=> b!196452 (= e!129386 (and e!129388 mapRes!7934))))

(declare-fun condMapEmpty!7934 () Bool)

(declare-fun mapDefault!7934 () ValueCell!1945)

