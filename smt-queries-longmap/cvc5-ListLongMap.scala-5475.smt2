; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72634 () Bool)

(assert start!72634)

(declare-fun b!843122 () Bool)

(declare-fun res!572980 () Bool)

(declare-fun e!470373 () Bool)

(assert (=> b!843122 (=> (not res!572980) (not e!470373))))

(declare-datatypes ((array!47630 0))(
  ( (array!47631 (arr!22846 (Array (_ BitVec 32) (_ BitVec 64))) (size!23286 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47630)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47630 (_ BitVec 32)) Bool)

(assert (=> b!843122 (= res!572980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843123 () Bool)

(assert (=> b!843123 (= e!470373 false)))

(declare-fun lt!381094 () Bool)

(declare-datatypes ((List!16230 0))(
  ( (Nil!16227) (Cons!16226 (h!17357 (_ BitVec 64)) (t!22601 List!16230)) )
))
(declare-fun arrayNoDuplicates!0 (array!47630 (_ BitVec 32) List!16230) Bool)

(assert (=> b!843123 (= lt!381094 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16227))))

(declare-fun b!843124 () Bool)

(declare-fun e!470377 () Bool)

(declare-fun tp_is_empty!15685 () Bool)

(assert (=> b!843124 (= e!470377 tp_is_empty!15685)))

(declare-fun b!843125 () Bool)

(declare-fun e!470376 () Bool)

(declare-fun e!470374 () Bool)

(declare-fun mapRes!25127 () Bool)

(assert (=> b!843125 (= e!470376 (and e!470374 mapRes!25127))))

(declare-fun condMapEmpty!25127 () Bool)

(declare-datatypes ((V!25961 0))(
  ( (V!25962 (val!7890 Int)) )
))
(declare-datatypes ((ValueCell!7403 0))(
  ( (ValueCellFull!7403 (v!10315 V!25961)) (EmptyCell!7403) )
))
(declare-datatypes ((array!47632 0))(
  ( (array!47633 (arr!22847 (Array (_ BitVec 32) ValueCell!7403)) (size!23287 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47632)

(declare-fun mapDefault!25127 () ValueCell!7403)

