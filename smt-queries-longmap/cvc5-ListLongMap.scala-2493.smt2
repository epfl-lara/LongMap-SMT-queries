; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38776 () Bool)

(assert start!38776)

(declare-fun b!404324 () Bool)

(declare-fun res!233155 () Bool)

(declare-fun e!243262 () Bool)

(assert (=> b!404324 (=> (not res!233155) (not e!243262))))

(declare-datatypes ((array!24285 0))(
  ( (array!24286 (arr!11592 (Array (_ BitVec 32) (_ BitVec 64))) (size!11944 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24285)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14699 0))(
  ( (V!14700 (val!5142 Int)) )
))
(declare-datatypes ((ValueCell!4754 0))(
  ( (ValueCellFull!4754 (v!7389 V!14699)) (EmptyCell!4754) )
))
(declare-datatypes ((array!24287 0))(
  ( (array!24288 (arr!11593 (Array (_ BitVec 32) ValueCell!4754)) (size!11945 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24287)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404324 (= res!233155 (and (= (size!11945 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11944 _keys!709) (size!11945 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404325 () Bool)

(declare-fun res!233149 () Bool)

(assert (=> b!404325 (=> (not res!233149) (not e!243262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24285 (_ BitVec 32)) Bool)

(assert (=> b!404325 (= res!233149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404326 () Bool)

(declare-fun res!233152 () Bool)

(assert (=> b!404326 (=> (not res!233152) (not e!243262))))

(declare-datatypes ((List!6750 0))(
  ( (Nil!6747) (Cons!6746 (h!7602 (_ BitVec 64)) (t!11924 List!6750)) )
))
(declare-fun arrayNoDuplicates!0 (array!24285 (_ BitVec 32) List!6750) Bool)

(assert (=> b!404326 (= res!233152 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6747))))

(declare-fun b!404327 () Bool)

(declare-fun e!243261 () Bool)

(assert (=> b!404327 (= e!243262 e!243261)))

(declare-fun res!233153 () Bool)

(assert (=> b!404327 (=> (not res!233153) (not e!243261))))

(declare-fun lt!188164 () array!24285)

(assert (=> b!404327 (= res!233153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188164 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404327 (= lt!188164 (array!24286 (store (arr!11592 _keys!709) i!563 k!794) (size!11944 _keys!709)))))

(declare-fun b!404328 () Bool)

(assert (=> b!404328 (= e!243261 false)))

(declare-fun lt!188165 () Bool)

(assert (=> b!404328 (= lt!188165 (arrayNoDuplicates!0 lt!188164 #b00000000000000000000000000000000 Nil!6747))))

(declare-fun res!233148 () Bool)

(assert (=> start!38776 (=> (not res!233148) (not e!243262))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38776 (= res!233148 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11944 _keys!709))))))

(assert (=> start!38776 e!243262))

(assert (=> start!38776 true))

(declare-fun e!243264 () Bool)

(declare-fun array_inv!8478 (array!24287) Bool)

(assert (=> start!38776 (and (array_inv!8478 _values!549) e!243264)))

(declare-fun array_inv!8479 (array!24285) Bool)

(assert (=> start!38776 (array_inv!8479 _keys!709)))

(declare-fun mapNonEmpty!16914 () Bool)

(declare-fun mapRes!16914 () Bool)

(declare-fun tp!33033 () Bool)

(declare-fun e!243260 () Bool)

(assert (=> mapNonEmpty!16914 (= mapRes!16914 (and tp!33033 e!243260))))

(declare-fun mapRest!16914 () (Array (_ BitVec 32) ValueCell!4754))

(declare-fun mapValue!16914 () ValueCell!4754)

(declare-fun mapKey!16914 () (_ BitVec 32))

(assert (=> mapNonEmpty!16914 (= (arr!11593 _values!549) (store mapRest!16914 mapKey!16914 mapValue!16914))))

(declare-fun b!404329 () Bool)

(declare-fun res!233150 () Bool)

(assert (=> b!404329 (=> (not res!233150) (not e!243262))))

(assert (=> b!404329 (= res!233150 (or (= (select (arr!11592 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11592 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16914 () Bool)

(assert (=> mapIsEmpty!16914 mapRes!16914))

(declare-fun b!404330 () Bool)

(declare-fun res!233151 () Bool)

(assert (=> b!404330 (=> (not res!233151) (not e!243262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404330 (= res!233151 (validMask!0 mask!1025))))

(declare-fun b!404331 () Bool)

(declare-fun e!243263 () Bool)

(assert (=> b!404331 (= e!243264 (and e!243263 mapRes!16914))))

(declare-fun condMapEmpty!16914 () Bool)

(declare-fun mapDefault!16914 () ValueCell!4754)

