; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40324 () Bool)

(assert start!40324)

(declare-fun b!442878 () Bool)

(declare-fun res!262349 () Bool)

(declare-fun e!260639 () Bool)

(assert (=> b!442878 (=> (not res!262349) (not e!260639))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442878 (= res!262349 (validKeyInArray!0 k!794))))

(declare-fun b!442879 () Bool)

(declare-fun e!260641 () Bool)

(assert (=> b!442879 (= e!260639 e!260641)))

(declare-fun res!262355 () Bool)

(assert (=> b!442879 (=> (not res!262355) (not e!260641))))

(declare-datatypes ((array!27257 0))(
  ( (array!27258 (arr!13077 (Array (_ BitVec 32) (_ BitVec 64))) (size!13429 (_ BitVec 32))) )
))
(declare-fun lt!203257 () array!27257)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27257 (_ BitVec 32)) Bool)

(assert (=> b!442879 (= res!262355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203257 mask!1025))))

(declare-fun _keys!709 () array!27257)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442879 (= lt!203257 (array!27258 (store (arr!13077 _keys!709) i!563 k!794) (size!13429 _keys!709)))))

(declare-fun res!262347 () Bool)

(assert (=> start!40324 (=> (not res!262347) (not e!260639))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40324 (= res!262347 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13429 _keys!709))))))

(assert (=> start!40324 e!260639))

(assert (=> start!40324 true))

(declare-datatypes ((V!16735 0))(
  ( (V!16736 (val!5906 Int)) )
))
(declare-datatypes ((ValueCell!5518 0))(
  ( (ValueCellFull!5518 (v!8157 V!16735)) (EmptyCell!5518) )
))
(declare-datatypes ((array!27259 0))(
  ( (array!27260 (arr!13078 (Array (_ BitVec 32) ValueCell!5518)) (size!13430 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27259)

(declare-fun e!260642 () Bool)

(declare-fun array_inv!9484 (array!27259) Bool)

(assert (=> start!40324 (and (array_inv!9484 _values!549) e!260642)))

(declare-fun array_inv!9485 (array!27257) Bool)

(assert (=> start!40324 (array_inv!9485 _keys!709)))

(declare-fun b!442880 () Bool)

(declare-fun e!260644 () Bool)

(declare-fun tp_is_empty!11723 () Bool)

(assert (=> b!442880 (= e!260644 tp_is_empty!11723)))

(declare-fun mapIsEmpty!19209 () Bool)

(declare-fun mapRes!19209 () Bool)

(assert (=> mapIsEmpty!19209 mapRes!19209))

(declare-fun mapNonEmpty!19209 () Bool)

(declare-fun tp!37191 () Bool)

(declare-fun e!260640 () Bool)

(assert (=> mapNonEmpty!19209 (= mapRes!19209 (and tp!37191 e!260640))))

(declare-fun mapValue!19209 () ValueCell!5518)

(declare-fun mapRest!19209 () (Array (_ BitVec 32) ValueCell!5518))

(declare-fun mapKey!19209 () (_ BitVec 32))

(assert (=> mapNonEmpty!19209 (= (arr!13078 _values!549) (store mapRest!19209 mapKey!19209 mapValue!19209))))

(declare-fun b!442881 () Bool)

(declare-fun res!262346 () Bool)

(assert (=> b!442881 (=> (not res!262346) (not e!260639))))

(declare-fun arrayContainsKey!0 (array!27257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442881 (= res!262346 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!442882 () Bool)

(declare-fun res!262350 () Bool)

(assert (=> b!442882 (=> (not res!262350) (not e!260639))))

(assert (=> b!442882 (= res!262350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442883 () Bool)

(declare-fun res!262351 () Bool)

(assert (=> b!442883 (=> (not res!262351) (not e!260639))))

(assert (=> b!442883 (= res!262351 (or (= (select (arr!13077 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13077 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442884 () Bool)

(assert (=> b!442884 (= e!260642 (and e!260644 mapRes!19209))))

(declare-fun condMapEmpty!19209 () Bool)

(declare-fun mapDefault!19209 () ValueCell!5518)

