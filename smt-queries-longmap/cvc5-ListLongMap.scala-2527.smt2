; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38980 () Bool)

(assert start!38980)

(declare-fun b!408302 () Bool)

(declare-fun res!236212 () Bool)

(declare-fun e!245096 () Bool)

(assert (=> b!408302 (=> (not res!236212) (not e!245096))))

(declare-datatypes ((array!24673 0))(
  ( (array!24674 (arr!11786 (Array (_ BitVec 32) (_ BitVec 64))) (size!12138 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24673)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24673 (_ BitVec 32)) Bool)

(assert (=> b!408302 (= res!236212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408303 () Bool)

(declare-fun res!236209 () Bool)

(assert (=> b!408303 (=> (not res!236209) (not e!245096))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408303 (= res!236209 (validKeyInArray!0 k!794))))

(declare-fun res!236214 () Bool)

(assert (=> start!38980 (=> (not res!236214) (not e!245096))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38980 (= res!236214 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12138 _keys!709))))))

(assert (=> start!38980 e!245096))

(assert (=> start!38980 true))

(declare-datatypes ((V!14971 0))(
  ( (V!14972 (val!5244 Int)) )
))
(declare-datatypes ((ValueCell!4856 0))(
  ( (ValueCellFull!4856 (v!7491 V!14971)) (EmptyCell!4856) )
))
(declare-datatypes ((array!24675 0))(
  ( (array!24676 (arr!11787 (Array (_ BitVec 32) ValueCell!4856)) (size!12139 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24675)

(declare-fun e!245095 () Bool)

(declare-fun array_inv!8596 (array!24675) Bool)

(assert (=> start!38980 (and (array_inv!8596 _values!549) e!245095)))

(declare-fun array_inv!8597 (array!24673) Bool)

(assert (=> start!38980 (array_inv!8597 _keys!709)))

(declare-fun b!408304 () Bool)

(declare-fun res!236213 () Bool)

(assert (=> b!408304 (=> (not res!236213) (not e!245096))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408304 (= res!236213 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12138 _keys!709))))))

(declare-fun b!408305 () Bool)

(declare-fun res!236211 () Bool)

(assert (=> b!408305 (=> (not res!236211) (not e!245096))))

(declare-datatypes ((List!6830 0))(
  ( (Nil!6827) (Cons!6826 (h!7682 (_ BitVec 64)) (t!12004 List!6830)) )
))
(declare-fun arrayNoDuplicates!0 (array!24673 (_ BitVec 32) List!6830) Bool)

(assert (=> b!408305 (= res!236211 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6827))))

(declare-fun b!408306 () Bool)

(declare-fun e!245100 () Bool)

(declare-fun mapRes!17220 () Bool)

(assert (=> b!408306 (= e!245095 (and e!245100 mapRes!17220))))

(declare-fun condMapEmpty!17220 () Bool)

(declare-fun mapDefault!17220 () ValueCell!4856)

