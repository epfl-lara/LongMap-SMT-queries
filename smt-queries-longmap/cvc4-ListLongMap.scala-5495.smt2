; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72758 () Bool)

(assert start!72758)

(declare-fun b!844424 () Bool)

(declare-fun e!471304 () Bool)

(assert (=> b!844424 (= e!471304 false)))

(declare-fun lt!381280 () Bool)

(declare-datatypes ((array!47850 0))(
  ( (array!47851 (arr!22956 (Array (_ BitVec 32) (_ BitVec 64))) (size!23396 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47850)

(declare-datatypes ((List!16271 0))(
  ( (Nil!16268) (Cons!16267 (h!17398 (_ BitVec 64)) (t!22642 List!16271)) )
))
(declare-fun arrayNoDuplicates!0 (array!47850 (_ BitVec 32) List!16271) Bool)

(assert (=> b!844424 (= lt!381280 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16268))))

(declare-fun b!844425 () Bool)

(declare-fun res!573723 () Bool)

(assert (=> b!844425 (=> (not res!573723) (not e!471304))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844425 (= res!573723 (validMask!0 mask!1196))))

(declare-fun b!844426 () Bool)

(declare-fun res!573724 () Bool)

(assert (=> b!844426 (=> (not res!573724) (not e!471304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47850 (_ BitVec 32)) Bool)

(assert (=> b!844426 (= res!573724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844427 () Bool)

(declare-fun e!471303 () Bool)

(declare-fun tp_is_empty!15809 () Bool)

(assert (=> b!844427 (= e!471303 tp_is_empty!15809)))

(declare-fun res!573725 () Bool)

(assert (=> start!72758 (=> (not res!573725) (not e!471304))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72758 (= res!573725 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23396 _keys!868))))))

(assert (=> start!72758 e!471304))

(assert (=> start!72758 true))

(declare-fun array_inv!18256 (array!47850) Bool)

(assert (=> start!72758 (array_inv!18256 _keys!868)))

(declare-datatypes ((V!26125 0))(
  ( (V!26126 (val!7952 Int)) )
))
(declare-datatypes ((ValueCell!7465 0))(
  ( (ValueCellFull!7465 (v!10377 V!26125)) (EmptyCell!7465) )
))
(declare-datatypes ((array!47852 0))(
  ( (array!47853 (arr!22957 (Array (_ BitVec 32) ValueCell!7465)) (size!23397 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47852)

(declare-fun e!471305 () Bool)

(declare-fun array_inv!18257 (array!47852) Bool)

(assert (=> start!72758 (and (array_inv!18257 _values!688) e!471305)))

(declare-fun b!844428 () Bool)

(declare-fun e!471307 () Bool)

(assert (=> b!844428 (= e!471307 tp_is_empty!15809)))

(declare-fun b!844429 () Bool)

(declare-fun mapRes!25313 () Bool)

(assert (=> b!844429 (= e!471305 (and e!471307 mapRes!25313))))

(declare-fun condMapEmpty!25313 () Bool)

(declare-fun mapDefault!25313 () ValueCell!7465)

