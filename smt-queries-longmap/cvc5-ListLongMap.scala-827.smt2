; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20058 () Bool)

(assert start!20058)

(declare-fun res!92702 () Bool)

(declare-fun e!129357 () Bool)

(assert (=> start!20058 (=> (not res!92702) (not e!129357))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20058 (= res!92702 (validMask!0 mask!1149))))

(assert (=> start!20058 e!129357))

(assert (=> start!20058 true))

(declare-datatypes ((V!5745 0))(
  ( (V!5746 (val!2331 Int)) )
))
(declare-datatypes ((ValueCell!1943 0))(
  ( (ValueCellFull!1943 (v!4301 V!5745)) (EmptyCell!1943) )
))
(declare-datatypes ((array!8403 0))(
  ( (array!8404 (arr!3952 (Array (_ BitVec 32) ValueCell!1943)) (size!4277 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8403)

(declare-fun e!129355 () Bool)

(declare-fun array_inv!2571 (array!8403) Bool)

(assert (=> start!20058 (and (array_inv!2571 _values!649) e!129355)))

(declare-datatypes ((array!8405 0))(
  ( (array!8406 (arr!3953 (Array (_ BitVec 32) (_ BitVec 64))) (size!4278 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8405)

(declare-fun array_inv!2572 (array!8405) Bool)

(assert (=> start!20058 (array_inv!2572 _keys!825)))

(declare-fun b!196413 () Bool)

(declare-fun e!129358 () Bool)

(declare-fun tp_is_empty!4573 () Bool)

(assert (=> b!196413 (= e!129358 tp_is_empty!4573)))

(declare-fun b!196414 () Bool)

(assert (=> b!196414 (= e!129357 false)))

(declare-fun lt!97614 () Bool)

(declare-datatypes ((List!2471 0))(
  ( (Nil!2468) (Cons!2467 (h!3109 (_ BitVec 64)) (t!7402 List!2471)) )
))
(declare-fun arrayNoDuplicates!0 (array!8405 (_ BitVec 32) List!2471) Bool)

(assert (=> b!196414 (= lt!97614 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2468))))

(declare-fun b!196415 () Bool)

(declare-fun res!92704 () Bool)

(assert (=> b!196415 (=> (not res!92704) (not e!129357))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196415 (= res!92704 (and (= (size!4277 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4278 _keys!825) (size!4277 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196416 () Bool)

(declare-fun e!129359 () Bool)

(assert (=> b!196416 (= e!129359 tp_is_empty!4573)))

(declare-fun mapNonEmpty!7928 () Bool)

(declare-fun mapRes!7928 () Bool)

(declare-fun tp!17216 () Bool)

(assert (=> mapNonEmpty!7928 (= mapRes!7928 (and tp!17216 e!129359))))

(declare-fun mapKey!7928 () (_ BitVec 32))

(declare-fun mapRest!7928 () (Array (_ BitVec 32) ValueCell!1943))

(declare-fun mapValue!7928 () ValueCell!1943)

(assert (=> mapNonEmpty!7928 (= (arr!3952 _values!649) (store mapRest!7928 mapKey!7928 mapValue!7928))))

(declare-fun b!196417 () Bool)

(assert (=> b!196417 (= e!129355 (and e!129358 mapRes!7928))))

(declare-fun condMapEmpty!7928 () Bool)

(declare-fun mapDefault!7928 () ValueCell!1943)

