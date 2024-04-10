; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39080 () Bool)

(assert start!39080)

(declare-fun b_free!9347 () Bool)

(declare-fun b_next!9347 () Bool)

(assert (=> start!39080 (= b_free!9347 (not b_next!9347))))

(declare-fun tp!33569 () Bool)

(declare-fun b_and!16733 () Bool)

(assert (=> start!39080 (= tp!33569 b_and!16733)))

(declare-fun b!410412 () Bool)

(declare-fun res!237873 () Bool)

(declare-fun e!245996 () Bool)

(assert (=> b!410412 (=> (not res!237873) (not e!245996))))

(declare-datatypes ((array!24867 0))(
  ( (array!24868 (arr!11883 (Array (_ BitVec 32) (_ BitVec 64))) (size!12235 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24867)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410412 (= res!237873 (or (= (select (arr!11883 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11883 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!237870 () Bool)

(assert (=> start!39080 (=> (not res!237870) (not e!245996))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39080 (= res!237870 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12235 _keys!709))))))

(assert (=> start!39080 e!245996))

(declare-fun tp_is_empty!10499 () Bool)

(assert (=> start!39080 tp_is_empty!10499))

(assert (=> start!39080 tp!33569))

(assert (=> start!39080 true))

(declare-datatypes ((V!15103 0))(
  ( (V!15104 (val!5294 Int)) )
))
(declare-datatypes ((ValueCell!4906 0))(
  ( (ValueCellFull!4906 (v!7541 V!15103)) (EmptyCell!4906) )
))
(declare-datatypes ((array!24869 0))(
  ( (array!24870 (arr!11884 (Array (_ BitVec 32) ValueCell!4906)) (size!12236 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24869)

(declare-fun e!245999 () Bool)

(declare-fun array_inv!8672 (array!24869) Bool)

(assert (=> start!39080 (and (array_inv!8672 _values!549) e!245999)))

(declare-fun array_inv!8673 (array!24867) Bool)

(assert (=> start!39080 (array_inv!8673 _keys!709)))

(declare-fun b!410413 () Bool)

(declare-fun e!245995 () Bool)

(assert (=> b!410413 (= e!245995 tp_is_empty!10499)))

(declare-fun mapNonEmpty!17370 () Bool)

(declare-fun mapRes!17370 () Bool)

(declare-fun tp!33570 () Bool)

(declare-fun e!245997 () Bool)

(assert (=> mapNonEmpty!17370 (= mapRes!17370 (and tp!33570 e!245997))))

(declare-fun mapValue!17370 () ValueCell!4906)

(declare-fun mapKey!17370 () (_ BitVec 32))

(declare-fun mapRest!17370 () (Array (_ BitVec 32) ValueCell!4906))

(assert (=> mapNonEmpty!17370 (= (arr!11884 _values!549) (store mapRest!17370 mapKey!17370 mapValue!17370))))

(declare-fun b!410414 () Bool)

(declare-fun res!237872 () Bool)

(assert (=> b!410414 (=> (not res!237872) (not e!245996))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410414 (= res!237872 (validKeyInArray!0 k!794))))

(declare-fun b!410415 () Bool)

(declare-fun res!237879 () Bool)

(assert (=> b!410415 (=> (not res!237879) (not e!245996))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410415 (= res!237879 (validMask!0 mask!1025))))

(declare-fun b!410416 () Bool)

(declare-fun res!237868 () Bool)

(declare-fun e!246000 () Bool)

(assert (=> b!410416 (=> (not res!237868) (not e!246000))))

(declare-fun lt!189076 () array!24867)

(declare-datatypes ((List!6889 0))(
  ( (Nil!6886) (Cons!6885 (h!7741 (_ BitVec 64)) (t!12063 List!6889)) )
))
(declare-fun arrayNoDuplicates!0 (array!24867 (_ BitVec 32) List!6889) Bool)

(assert (=> b!410416 (= res!237868 (arrayNoDuplicates!0 lt!189076 #b00000000000000000000000000000000 Nil!6886))))

(declare-fun b!410417 () Bool)

(declare-fun res!237874 () Bool)

(assert (=> b!410417 (=> (not res!237874) (not e!245996))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410417 (= res!237874 (and (= (size!12236 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12235 _keys!709) (size!12236 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17370 () Bool)

(assert (=> mapIsEmpty!17370 mapRes!17370))

(declare-fun b!410418 () Bool)

(declare-fun res!237878 () Bool)

(assert (=> b!410418 (=> (not res!237878) (not e!245996))))

(declare-fun arrayContainsKey!0 (array!24867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410418 (= res!237878 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!410419 () Bool)

(assert (=> b!410419 (= e!246000 false)))

(declare-fun minValue!515 () V!15103)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6864 0))(
  ( (tuple2!6865 (_1!3443 (_ BitVec 64)) (_2!3443 V!15103)) )
))
(declare-datatypes ((List!6890 0))(
  ( (Nil!6887) (Cons!6886 (h!7742 tuple2!6864) (t!12064 List!6890)) )
))
(declare-datatypes ((ListLongMap!5777 0))(
  ( (ListLongMap!5778 (toList!2904 List!6890)) )
))
(declare-fun lt!189077 () ListLongMap!5777)

(declare-fun zeroValue!515 () V!15103)

(declare-fun getCurrentListMapNoExtraKeys!1112 (array!24867 array!24869 (_ BitVec 32) (_ BitVec 32) V!15103 V!15103 (_ BitVec 32) Int) ListLongMap!5777)

(assert (=> b!410419 (= lt!189077 (getCurrentListMapNoExtraKeys!1112 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410420 () Bool)

(declare-fun res!237877 () Bool)

(assert (=> b!410420 (=> (not res!237877) (not e!246000))))

(assert (=> b!410420 (= res!237877 (bvsle from!863 i!563))))

(declare-fun b!410421 () Bool)

(declare-fun res!237876 () Bool)

(assert (=> b!410421 (=> (not res!237876) (not e!245996))))

(assert (=> b!410421 (= res!237876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12235 _keys!709))))))

(declare-fun b!410422 () Bool)

(declare-fun res!237871 () Bool)

(assert (=> b!410422 (=> (not res!237871) (not e!245996))))

(assert (=> b!410422 (= res!237871 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6886))))

(declare-fun b!410423 () Bool)

(assert (=> b!410423 (= e!245999 (and e!245995 mapRes!17370))))

(declare-fun condMapEmpty!17370 () Bool)

(declare-fun mapDefault!17370 () ValueCell!4906)

