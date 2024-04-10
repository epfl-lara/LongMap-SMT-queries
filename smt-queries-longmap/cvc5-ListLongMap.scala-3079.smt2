; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43366 () Bool)

(assert start!43366)

(declare-fun b_free!12193 () Bool)

(declare-fun b_next!12193 () Bool)

(assert (=> start!43366 (= b_free!12193 (not b_next!12193))))

(declare-fun tp!42856 () Bool)

(declare-fun b_and!20949 () Bool)

(assert (=> start!43366 (= tp!42856 b_and!20949)))

(declare-fun b!480396 () Bool)

(declare-fun res!286496 () Bool)

(declare-fun e!282673 () Bool)

(assert (=> b!480396 (=> (not res!286496) (not e!282673))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31077 0))(
  ( (array!31078 (arr!14943 (Array (_ BitVec 32) (_ BitVec 64))) (size!15301 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31077)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19345 0))(
  ( (V!19346 (val!6900 Int)) )
))
(declare-datatypes ((ValueCell!6491 0))(
  ( (ValueCellFull!6491 (v!9191 V!19345)) (EmptyCell!6491) )
))
(declare-datatypes ((array!31079 0))(
  ( (array!31080 (arr!14944 (Array (_ BitVec 32) ValueCell!6491)) (size!15302 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31079)

(assert (=> b!480396 (= res!286496 (and (= (size!15302 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15301 _keys!1874) (size!15302 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480397 () Bool)

(assert (=> b!480397 (= e!282673 (not true))))

(declare-fun lt!218143 () (_ BitVec 32))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31077 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480397 (= lt!218143 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282670 () Bool)

(assert (=> b!480397 e!282670))

(declare-fun c!57775 () Bool)

(assert (=> b!480397 (= c!57775 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14084 0))(
  ( (Unit!14085) )
))
(declare-fun lt!218142 () Unit!14084)

(declare-fun minValue!1458 () V!19345)

(declare-fun zeroValue!1458 () V!19345)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!115 (array!31077 array!31079 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 64) Int) Unit!14084)

(assert (=> b!480397 (= lt!218142 (lemmaKeyInListMapIsInArray!115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!480398 () Bool)

(declare-fun res!286497 () Bool)

(assert (=> b!480398 (=> (not res!286497) (not e!282673))))

(declare-datatypes ((tuple2!9056 0))(
  ( (tuple2!9057 (_1!4539 (_ BitVec 64)) (_2!4539 V!19345)) )
))
(declare-datatypes ((List!9134 0))(
  ( (Nil!9131) (Cons!9130 (h!9986 tuple2!9056) (t!15344 List!9134)) )
))
(declare-datatypes ((ListLongMap!7969 0))(
  ( (ListLongMap!7970 (toList!4000 List!9134)) )
))
(declare-fun contains!2612 (ListLongMap!7969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2319 (array!31077 array!31079 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 32) Int) ListLongMap!7969)

(assert (=> b!480398 (= res!286497 (contains!2612 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapNonEmpty!22261 () Bool)

(declare-fun mapRes!22261 () Bool)

(declare-fun tp!42855 () Bool)

(declare-fun e!282672 () Bool)

(assert (=> mapNonEmpty!22261 (= mapRes!22261 (and tp!42855 e!282672))))

(declare-fun mapRest!22261 () (Array (_ BitVec 32) ValueCell!6491))

(declare-fun mapKey!22261 () (_ BitVec 32))

(declare-fun mapValue!22261 () ValueCell!6491)

(assert (=> mapNonEmpty!22261 (= (arr!14944 _values!1516) (store mapRest!22261 mapKey!22261 mapValue!22261))))

(declare-fun b!480399 () Bool)

(declare-fun arrayContainsKey!0 (array!31077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480399 (= e!282670 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22261 () Bool)

(assert (=> mapIsEmpty!22261 mapRes!22261))

(declare-fun res!286494 () Bool)

(assert (=> start!43366 (=> (not res!286494) (not e!282673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43366 (= res!286494 (validMask!0 mask!2352))))

(assert (=> start!43366 e!282673))

(assert (=> start!43366 true))

(declare-fun tp_is_empty!13705 () Bool)

(assert (=> start!43366 tp_is_empty!13705))

(declare-fun e!282674 () Bool)

(declare-fun array_inv!10776 (array!31079) Bool)

(assert (=> start!43366 (and (array_inv!10776 _values!1516) e!282674)))

(assert (=> start!43366 tp!42856))

(declare-fun array_inv!10777 (array!31077) Bool)

(assert (=> start!43366 (array_inv!10777 _keys!1874)))

(declare-fun b!480400 () Bool)

(declare-fun res!286493 () Bool)

(assert (=> b!480400 (=> (not res!286493) (not e!282673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480400 (= res!286493 (validKeyInArray!0 k!1332))))

(declare-fun b!480401 () Bool)

(assert (=> b!480401 (= e!282672 tp_is_empty!13705)))

(declare-fun b!480402 () Bool)

(declare-fun res!286492 () Bool)

(assert (=> b!480402 (=> (not res!286492) (not e!282673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31077 (_ BitVec 32)) Bool)

(assert (=> b!480402 (= res!286492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480403 () Bool)

(assert (=> b!480403 (= e!282670 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480404 () Bool)

(declare-fun e!282671 () Bool)

(assert (=> b!480404 (= e!282674 (and e!282671 mapRes!22261))))

(declare-fun condMapEmpty!22261 () Bool)

(declare-fun mapDefault!22261 () ValueCell!6491)

