; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41054 () Bool)

(assert start!41054)

(declare-fun b_free!10967 () Bool)

(declare-fun b_next!10967 () Bool)

(assert (=> start!41054 (= b_free!10967 (not b_next!10967))))

(declare-fun tp!38730 () Bool)

(declare-fun b_and!19141 () Bool)

(assert (=> start!41054 (= tp!38730 b_and!19141)))

(declare-fun mapIsEmpty!20101 () Bool)

(declare-fun mapRes!20101 () Bool)

(assert (=> mapIsEmpty!20101 mapRes!20101))

(declare-fun b!457667 () Bool)

(declare-fun res!273308 () Bool)

(declare-fun e!267275 () Bool)

(assert (=> b!457667 (=> (not res!273308) (not e!267275))))

(declare-datatypes ((array!28411 0))(
  ( (array!28412 (arr!13648 (Array (_ BitVec 32) (_ BitVec 64))) (size!14000 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28411)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457667 (= res!273308 (or (= (select (arr!13648 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13648 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457668 () Bool)

(declare-fun res!273311 () Bool)

(assert (=> b!457668 (=> (not res!273311) (not e!267275))))

(assert (=> b!457668 (= res!273311 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14000 _keys!709))))))

(declare-fun b!457669 () Bool)

(declare-fun res!273314 () Bool)

(assert (=> b!457669 (=> (not res!273314) (not e!267275))))

(declare-datatypes ((List!8237 0))(
  ( (Nil!8234) (Cons!8233 (h!9089 (_ BitVec 64)) (t!14083 List!8237)) )
))
(declare-fun arrayNoDuplicates!0 (array!28411 (_ BitVec 32) List!8237) Bool)

(assert (=> b!457669 (= res!273314 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8234))))

(declare-fun b!457671 () Bool)

(declare-fun e!267276 () Bool)

(assert (=> b!457671 (= e!267276 true)))

(declare-datatypes ((V!17511 0))(
  ( (V!17512 (val!6197 Int)) )
))
(declare-datatypes ((tuple2!8164 0))(
  ( (tuple2!8165 (_1!4093 (_ BitVec 64)) (_2!4093 V!17511)) )
))
(declare-datatypes ((List!8238 0))(
  ( (Nil!8235) (Cons!8234 (h!9090 tuple2!8164) (t!14084 List!8238)) )
))
(declare-datatypes ((ListLongMap!7077 0))(
  ( (ListLongMap!7078 (toList!3554 List!8238)) )
))
(declare-fun lt!207018 () ListLongMap!7077)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5809 0))(
  ( (ValueCellFull!5809 (v!8467 V!17511)) (EmptyCell!5809) )
))
(declare-datatypes ((array!28413 0))(
  ( (array!28414 (arr!13649 (Array (_ BitVec 32) ValueCell!5809)) (size!14001 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28413)

(declare-fun lt!207023 () ListLongMap!7077)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1590 (ListLongMap!7077 tuple2!8164) ListLongMap!7077)

(declare-fun get!6718 (ValueCell!5809 V!17511) V!17511)

(declare-fun dynLambda!880 (Int (_ BitVec 64)) V!17511)

(assert (=> b!457671 (= lt!207023 (+!1590 lt!207018 (tuple2!8165 (select (arr!13648 _keys!709) from!863) (get!6718 (select (arr!13649 _values!549) from!863) (dynLambda!880 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!20101 () Bool)

(declare-fun tp!38731 () Bool)

(declare-fun e!267279 () Bool)

(assert (=> mapNonEmpty!20101 (= mapRes!20101 (and tp!38731 e!267279))))

(declare-fun mapValue!20101 () ValueCell!5809)

(declare-fun mapKey!20101 () (_ BitVec 32))

(declare-fun mapRest!20101 () (Array (_ BitVec 32) ValueCell!5809))

(assert (=> mapNonEmpty!20101 (= (arr!13649 _values!549) (store mapRest!20101 mapKey!20101 mapValue!20101))))

(declare-fun b!457672 () Bool)

(declare-fun e!267277 () Bool)

(assert (=> b!457672 (= e!267275 e!267277)))

(declare-fun res!273312 () Bool)

(assert (=> b!457672 (=> (not res!273312) (not e!267277))))

(declare-fun lt!207017 () array!28411)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28411 (_ BitVec 32)) Bool)

(assert (=> b!457672 (= res!273312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207017 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!457672 (= lt!207017 (array!28412 (store (arr!13648 _keys!709) i!563 k!794) (size!14000 _keys!709)))))

(declare-fun b!457673 () Bool)

(declare-fun res!273313 () Bool)

(assert (=> b!457673 (=> (not res!273313) (not e!267275))))

(declare-fun arrayContainsKey!0 (array!28411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457673 (= res!273313 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!457674 () Bool)

(declare-fun res!273309 () Bool)

(assert (=> b!457674 (=> (not res!273309) (not e!267275))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!457674 (= res!273309 (and (= (size!14001 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14000 _keys!709) (size!14001 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457675 () Bool)

(declare-fun e!267278 () Bool)

(declare-fun e!267281 () Bool)

(assert (=> b!457675 (= e!267278 (and e!267281 mapRes!20101))))

(declare-fun condMapEmpty!20101 () Bool)

(declare-fun mapDefault!20101 () ValueCell!5809)

