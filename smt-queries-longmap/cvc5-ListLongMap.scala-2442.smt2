; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38470 () Bool)

(assert start!38470)

(declare-fun b!397061 () Bool)

(declare-fun res!227913 () Bool)

(declare-fun e!240184 () Bool)

(assert (=> b!397061 (=> (not res!227913) (not e!240184))))

(declare-datatypes ((array!23691 0))(
  ( (array!23692 (arr!11295 (Array (_ BitVec 32) (_ BitVec 64))) (size!11647 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23691)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397061 (= res!227913 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397062 () Bool)

(declare-fun e!240185 () Bool)

(declare-fun tp_is_empty!9889 () Bool)

(assert (=> b!397062 (= e!240185 tp_is_empty!9889)))

(declare-fun b!397063 () Bool)

(declare-fun e!240186 () Bool)

(assert (=> b!397063 (= e!240186 false)))

(declare-fun lt!187246 () Bool)

(declare-fun lt!187247 () array!23691)

(declare-datatypes ((List!6540 0))(
  ( (Nil!6537) (Cons!6536 (h!7392 (_ BitVec 64)) (t!11714 List!6540)) )
))
(declare-fun arrayNoDuplicates!0 (array!23691 (_ BitVec 32) List!6540) Bool)

(assert (=> b!397063 (= lt!187246 (arrayNoDuplicates!0 lt!187247 #b00000000000000000000000000000000 Nil!6537))))

(declare-fun b!397064 () Bool)

(declare-fun res!227912 () Bool)

(assert (=> b!397064 (=> (not res!227912) (not e!240184))))

(assert (=> b!397064 (= res!227912 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6537))))

(declare-fun b!397065 () Bool)

(declare-fun e!240182 () Bool)

(assert (=> b!397065 (= e!240182 tp_is_empty!9889)))

(declare-fun b!397066 () Bool)

(declare-fun res!227919 () Bool)

(assert (=> b!397066 (=> (not res!227919) (not e!240184))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397066 (= res!227919 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11647 _keys!709))))))

(declare-fun b!397067 () Bool)

(declare-fun res!227914 () Bool)

(assert (=> b!397067 (=> (not res!227914) (not e!240184))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14291 0))(
  ( (V!14292 (val!4989 Int)) )
))
(declare-datatypes ((ValueCell!4601 0))(
  ( (ValueCellFull!4601 (v!7236 V!14291)) (EmptyCell!4601) )
))
(declare-datatypes ((array!23693 0))(
  ( (array!23694 (arr!11296 (Array (_ BitVec 32) ValueCell!4601)) (size!11648 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23693)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397067 (= res!227914 (and (= (size!11648 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11647 _keys!709) (size!11648 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16455 () Bool)

(declare-fun mapRes!16455 () Bool)

(assert (=> mapIsEmpty!16455 mapRes!16455))

(declare-fun res!227915 () Bool)

(assert (=> start!38470 (=> (not res!227915) (not e!240184))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38470 (= res!227915 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11647 _keys!709))))))

(assert (=> start!38470 e!240184))

(assert (=> start!38470 true))

(declare-fun e!240183 () Bool)

(declare-fun array_inv!8280 (array!23693) Bool)

(assert (=> start!38470 (and (array_inv!8280 _values!549) e!240183)))

(declare-fun array_inv!8281 (array!23691) Bool)

(assert (=> start!38470 (array_inv!8281 _keys!709)))

(declare-fun b!397068 () Bool)

(declare-fun res!227916 () Bool)

(assert (=> b!397068 (=> (not res!227916) (not e!240184))))

(assert (=> b!397068 (= res!227916 (or (= (select (arr!11295 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11295 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397069 () Bool)

(assert (=> b!397069 (= e!240184 e!240186)))

(declare-fun res!227917 () Bool)

(assert (=> b!397069 (=> (not res!227917) (not e!240186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23691 (_ BitVec 32)) Bool)

(assert (=> b!397069 (= res!227917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187247 mask!1025))))

(assert (=> b!397069 (= lt!187247 (array!23692 (store (arr!11295 _keys!709) i!563 k!794) (size!11647 _keys!709)))))

(declare-fun b!397070 () Bool)

(assert (=> b!397070 (= e!240183 (and e!240182 mapRes!16455))))

(declare-fun condMapEmpty!16455 () Bool)

(declare-fun mapDefault!16455 () ValueCell!4601)

