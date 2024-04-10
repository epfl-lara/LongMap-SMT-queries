; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!840 () Bool)

(assert start!840)

(declare-fun b_free!233 () Bool)

(declare-fun b_next!233 () Bool)

(assert (=> start!840 (= b_free!233 (not b_next!233))))

(declare-fun tp!929 () Bool)

(declare-fun b_and!379 () Bool)

(assert (=> start!840 (= tp!929 b_and!379)))

(declare-fun b!6704 () Bool)

(declare-fun e!3707 () Bool)

(declare-fun e!3704 () Bool)

(assert (=> b!6704 (= e!3707 e!3704)))

(declare-fun res!6988 () Bool)

(assert (=> b!6704 (=> res!6988 e!3704)))

(declare-datatypes ((array!555 0))(
  ( (array!556 (arr!266 (Array (_ BitVec 32) (_ BitVec 64))) (size!328 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!555)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6704 (= res!6988 (not (= (size!328 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1290 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!555 (_ BitVec 32)) Bool)

(assert (=> b!6704 (arrayForallSeekEntryOrOpenFound!0 lt!1290 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!119 0))(
  ( (Unit!120) )
))
(declare-fun lt!1289 () Unit!119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!119)

(assert (=> b!6704 (= lt!1289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1290))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!555 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6704 (= lt!1290 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6705 () Bool)

(declare-fun e!3703 () Bool)

(declare-fun tp_is_empty!311 () Bool)

(assert (=> b!6705 (= e!3703 tp_is_empty!311)))

(declare-fun res!6983 () Bool)

(declare-fun e!3700 () Bool)

(assert (=> start!840 (=> (not res!6983) (not e!3700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!840 (= res!6983 (validMask!0 mask!2250))))

(assert (=> start!840 e!3700))

(assert (=> start!840 tp!929))

(assert (=> start!840 true))

(declare-datatypes ((V!591 0))(
  ( (V!592 (val!161 Int)) )
))
(declare-datatypes ((ValueCell!139 0))(
  ( (ValueCellFull!139 (v!1252 V!591)) (EmptyCell!139) )
))
(declare-datatypes ((array!557 0))(
  ( (array!558 (arr!267 (Array (_ BitVec 32) ValueCell!139)) (size!329 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!557)

(declare-fun e!3701 () Bool)

(declare-fun array_inv!193 (array!557) Bool)

(assert (=> start!840 (and (array_inv!193 _values!1492) e!3701)))

(assert (=> start!840 tp_is_empty!311))

(declare-fun array_inv!194 (array!555) Bool)

(assert (=> start!840 (array_inv!194 _keys!1806)))

(declare-fun b!6706 () Bool)

(declare-fun e!3706 () Bool)

(declare-fun arrayContainsKey!0 (array!555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6706 (= e!3706 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6707 () Bool)

(declare-fun e!3702 () Bool)

(assert (=> b!6707 (= e!3702 tp_is_empty!311)))

(declare-fun b!6708 () Bool)

(declare-fun mapRes!437 () Bool)

(assert (=> b!6708 (= e!3701 (and e!3703 mapRes!437))))

(declare-fun condMapEmpty!437 () Bool)

(declare-fun mapDefault!437 () ValueCell!139)

