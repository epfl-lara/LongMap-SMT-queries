; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40974 () Bool)

(assert start!40974)

(declare-fun b_free!10909 () Bool)

(declare-fun b_next!10909 () Bool)

(assert (=> start!40974 (= b_free!10909 (not b_next!10909))))

(declare-fun tp!38554 () Bool)

(declare-fun b_and!19051 () Bool)

(assert (=> start!40974 (= tp!38554 b_and!19051)))

(declare-fun b!456077 () Bool)

(declare-fun e!266536 () Bool)

(assert (=> b!456077 (= e!266536 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17435 0))(
  ( (V!17436 (val!6168 Int)) )
))
(declare-fun minValue!515 () V!17435)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5780 0))(
  ( (ValueCellFull!5780 (v!8434 V!17435)) (EmptyCell!5780) )
))
(declare-datatypes ((array!28297 0))(
  ( (array!28298 (arr!13592 (Array (_ BitVec 32) ValueCell!5780)) (size!13944 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28297)

(declare-fun zeroValue!515 () V!17435)

(declare-datatypes ((array!28299 0))(
  ( (array!28300 (arr!13593 (Array (_ BitVec 32) (_ BitVec 64))) (size!13945 (_ BitVec 32))) )
))
(declare-fun lt!206464 () array!28299)

(declare-fun v!412 () V!17435)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!8126 0))(
  ( (tuple2!8127 (_1!4074 (_ BitVec 64)) (_2!4074 V!17435)) )
))
(declare-datatypes ((List!8197 0))(
  ( (Nil!8194) (Cons!8193 (h!9049 tuple2!8126) (t!14025 List!8197)) )
))
(declare-datatypes ((ListLongMap!7039 0))(
  ( (ListLongMap!7040 (toList!3535 List!8197)) )
))
(declare-fun lt!206463 () ListLongMap!7039)

(declare-fun getCurrentListMapNoExtraKeys!1718 (array!28299 array!28297 (_ BitVec 32) (_ BitVec 32) V!17435 V!17435 (_ BitVec 32) Int) ListLongMap!7039)

(assert (=> b!456077 (= lt!206463 (getCurrentListMapNoExtraKeys!1718 lt!206464 (array!28298 (store (arr!13592 _values!549) i!563 (ValueCellFull!5780 v!412)) (size!13944 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206465 () ListLongMap!7039)

(declare-fun _keys!709 () array!28299)

(assert (=> b!456077 (= lt!206465 (getCurrentListMapNoExtraKeys!1718 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20011 () Bool)

(declare-fun mapRes!20011 () Bool)

(assert (=> mapIsEmpty!20011 mapRes!20011))

(declare-fun b!456079 () Bool)

(declare-fun res!272087 () Bool)

(declare-fun e!266538 () Bool)

(assert (=> b!456079 (=> (not res!272087) (not e!266538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28299 (_ BitVec 32)) Bool)

(assert (=> b!456079 (= res!272087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456080 () Bool)

(declare-fun e!266535 () Bool)

(declare-fun tp_is_empty!12247 () Bool)

(assert (=> b!456080 (= e!266535 tp_is_empty!12247)))

(declare-fun mapNonEmpty!20011 () Bool)

(declare-fun tp!38553 () Bool)

(assert (=> mapNonEmpty!20011 (= mapRes!20011 (and tp!38553 e!266535))))

(declare-fun mapValue!20011 () ValueCell!5780)

(declare-fun mapRest!20011 () (Array (_ BitVec 32) ValueCell!5780))

(declare-fun mapKey!20011 () (_ BitVec 32))

(assert (=> mapNonEmpty!20011 (= (arr!13592 _values!549) (store mapRest!20011 mapKey!20011 mapValue!20011))))

(declare-fun b!456081 () Bool)

(declare-fun res!272078 () Bool)

(assert (=> b!456081 (=> (not res!272078) (not e!266538))))

(assert (=> b!456081 (= res!272078 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13945 _keys!709))))))

(declare-fun b!456082 () Bool)

(declare-fun res!272076 () Bool)

(assert (=> b!456082 (=> (not res!272076) (not e!266538))))

(declare-datatypes ((List!8198 0))(
  ( (Nil!8195) (Cons!8194 (h!9050 (_ BitVec 64)) (t!14026 List!8198)) )
))
(declare-fun arrayNoDuplicates!0 (array!28299 (_ BitVec 32) List!8198) Bool)

(assert (=> b!456082 (= res!272076 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8195))))

(declare-fun b!456083 () Bool)

(declare-fun res!272080 () Bool)

(assert (=> b!456083 (=> (not res!272080) (not e!266536))))

(assert (=> b!456083 (= res!272080 (bvsle from!863 i!563))))

(declare-fun b!456084 () Bool)

(declare-fun e!266537 () Bool)

(assert (=> b!456084 (= e!266537 tp_is_empty!12247)))

(declare-fun b!456085 () Bool)

(assert (=> b!456085 (= e!266538 e!266536)))

(declare-fun res!272083 () Bool)

(assert (=> b!456085 (=> (not res!272083) (not e!266536))))

(assert (=> b!456085 (= res!272083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206464 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!456085 (= lt!206464 (array!28300 (store (arr!13593 _keys!709) i!563 k!794) (size!13945 _keys!709)))))

(declare-fun b!456086 () Bool)

(declare-fun res!272077 () Bool)

(assert (=> b!456086 (=> (not res!272077) (not e!266538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456086 (= res!272077 (validKeyInArray!0 k!794))))

(declare-fun b!456087 () Bool)

(declare-fun res!272084 () Bool)

(assert (=> b!456087 (=> (not res!272084) (not e!266538))))

(declare-fun arrayContainsKey!0 (array!28299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456087 (= res!272084 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!456088 () Bool)

(declare-fun e!266534 () Bool)

(assert (=> b!456088 (= e!266534 (and e!266537 mapRes!20011))))

(declare-fun condMapEmpty!20011 () Bool)

(declare-fun mapDefault!20011 () ValueCell!5780)

