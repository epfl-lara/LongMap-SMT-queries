; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39104 () Bool)

(assert start!39104)

(declare-fun b_free!9371 () Bool)

(declare-fun b_next!9371 () Bool)

(assert (=> start!39104 (= b_free!9371 (not b_next!9371))))

(declare-fun tp!33642 () Bool)

(declare-fun b_and!16757 () Bool)

(assert (=> start!39104 (= tp!33642 b_and!16757)))

(declare-fun b!410952 () Bool)

(declare-fun e!246215 () Bool)

(declare-fun e!246216 () Bool)

(assert (=> b!410952 (= e!246215 e!246216)))

(declare-fun res!238304 () Bool)

(assert (=> b!410952 (=> (not res!238304) (not e!246216))))

(declare-datatypes ((array!24907 0))(
  ( (array!24908 (arr!11903 (Array (_ BitVec 32) (_ BitVec 64))) (size!12255 (_ BitVec 32))) )
))
(declare-fun lt!189183 () array!24907)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24907 (_ BitVec 32)) Bool)

(assert (=> b!410952 (= res!238304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189183 mask!1025))))

(declare-fun _keys!709 () array!24907)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410952 (= lt!189183 (array!24908 (store (arr!11903 _keys!709) i!563 k!794) (size!12255 _keys!709)))))

(declare-fun b!410953 () Bool)

(declare-fun res!238310 () Bool)

(assert (=> b!410953 (=> (not res!238310) (not e!246216))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!410953 (= res!238310 (bvsle from!863 i!563))))

(declare-fun b!410954 () Bool)

(declare-fun res!238300 () Bool)

(assert (=> b!410954 (=> (not res!238300) (not e!246215))))

(assert (=> b!410954 (= res!238300 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12255 _keys!709))))))

(declare-fun b!410955 () Bool)

(declare-fun res!238302 () Bool)

(assert (=> b!410955 (=> (not res!238302) (not e!246215))))

(assert (=> b!410955 (= res!238302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410956 () Bool)

(declare-fun res!238305 () Bool)

(assert (=> b!410956 (=> (not res!238305) (not e!246215))))

(declare-datatypes ((List!6905 0))(
  ( (Nil!6902) (Cons!6901 (h!7757 (_ BitVec 64)) (t!12079 List!6905)) )
))
(declare-fun arrayNoDuplicates!0 (array!24907 (_ BitVec 32) List!6905) Bool)

(assert (=> b!410956 (= res!238305 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6902))))

(declare-fun res!238307 () Bool)

(assert (=> start!39104 (=> (not res!238307) (not e!246215))))

(assert (=> start!39104 (= res!238307 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12255 _keys!709))))))

(assert (=> start!39104 e!246215))

(declare-fun tp_is_empty!10523 () Bool)

(assert (=> start!39104 tp_is_empty!10523))

(assert (=> start!39104 tp!33642))

(assert (=> start!39104 true))

(declare-datatypes ((V!15135 0))(
  ( (V!15136 (val!5306 Int)) )
))
(declare-datatypes ((ValueCell!4918 0))(
  ( (ValueCellFull!4918 (v!7553 V!15135)) (EmptyCell!4918) )
))
(declare-datatypes ((array!24909 0))(
  ( (array!24910 (arr!11904 (Array (_ BitVec 32) ValueCell!4918)) (size!12256 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24909)

(declare-fun e!246212 () Bool)

(declare-fun array_inv!8686 (array!24909) Bool)

(assert (=> start!39104 (and (array_inv!8686 _values!549) e!246212)))

(declare-fun array_inv!8687 (array!24907) Bool)

(assert (=> start!39104 (array_inv!8687 _keys!709)))

(declare-fun b!410957 () Bool)

(declare-fun res!238306 () Bool)

(assert (=> b!410957 (=> (not res!238306) (not e!246215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410957 (= res!238306 (validKeyInArray!0 k!794))))

(declare-fun b!410958 () Bool)

(declare-fun res!238303 () Bool)

(assert (=> b!410958 (=> (not res!238303) (not e!246215))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410958 (= res!238303 (and (= (size!12256 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12255 _keys!709) (size!12256 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410959 () Bool)

(declare-fun e!246214 () Bool)

(assert (=> b!410959 (= e!246214 tp_is_empty!10523)))

(declare-fun b!410960 () Bool)

(declare-fun res!238309 () Bool)

(assert (=> b!410960 (=> (not res!238309) (not e!246215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410960 (= res!238309 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17406 () Bool)

(declare-fun mapRes!17406 () Bool)

(declare-fun tp!33641 () Bool)

(declare-fun e!246213 () Bool)

(assert (=> mapNonEmpty!17406 (= mapRes!17406 (and tp!33641 e!246213))))

(declare-fun mapKey!17406 () (_ BitVec 32))

(declare-fun mapValue!17406 () ValueCell!4918)

(declare-fun mapRest!17406 () (Array (_ BitVec 32) ValueCell!4918))

(assert (=> mapNonEmpty!17406 (= (arr!11904 _values!549) (store mapRest!17406 mapKey!17406 mapValue!17406))))

(declare-fun b!410961 () Bool)

(assert (=> b!410961 (= e!246213 tp_is_empty!10523)))

(declare-fun b!410962 () Bool)

(declare-fun res!238311 () Bool)

(assert (=> b!410962 (=> (not res!238311) (not e!246216))))

(assert (=> b!410962 (= res!238311 (arrayNoDuplicates!0 lt!189183 #b00000000000000000000000000000000 Nil!6902))))

(declare-fun b!410963 () Bool)

(assert (=> b!410963 (= e!246216 false)))

(declare-datatypes ((tuple2!6880 0))(
  ( (tuple2!6881 (_1!3451 (_ BitVec 64)) (_2!3451 V!15135)) )
))
(declare-datatypes ((List!6906 0))(
  ( (Nil!6903) (Cons!6902 (h!7758 tuple2!6880) (t!12080 List!6906)) )
))
(declare-datatypes ((ListLongMap!5793 0))(
  ( (ListLongMap!5794 (toList!2912 List!6906)) )
))
(declare-fun lt!189184 () ListLongMap!5793)

(declare-fun minValue!515 () V!15135)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15135)

(declare-fun v!412 () V!15135)

(declare-fun getCurrentListMapNoExtraKeys!1120 (array!24907 array!24909 (_ BitVec 32) (_ BitVec 32) V!15135 V!15135 (_ BitVec 32) Int) ListLongMap!5793)

(assert (=> b!410963 (= lt!189184 (getCurrentListMapNoExtraKeys!1120 lt!189183 (array!24910 (store (arr!11904 _values!549) i!563 (ValueCellFull!4918 v!412)) (size!12256 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189185 () ListLongMap!5793)

(assert (=> b!410963 (= lt!189185 (getCurrentListMapNoExtraKeys!1120 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410964 () Bool)

(declare-fun res!238308 () Bool)

(assert (=> b!410964 (=> (not res!238308) (not e!246215))))

(assert (=> b!410964 (= res!238308 (or (= (select (arr!11903 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11903 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410965 () Bool)

(declare-fun res!238301 () Bool)

(assert (=> b!410965 (=> (not res!238301) (not e!246215))))

(declare-fun arrayContainsKey!0 (array!24907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410965 (= res!238301 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17406 () Bool)

(assert (=> mapIsEmpty!17406 mapRes!17406))

(declare-fun b!410966 () Bool)

(assert (=> b!410966 (= e!246212 (and e!246214 mapRes!17406))))

(declare-fun condMapEmpty!17406 () Bool)

(declare-fun mapDefault!17406 () ValueCell!4918)

