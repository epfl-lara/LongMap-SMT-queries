; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111100 () Bool)

(assert start!111100)

(declare-fun b_free!29935 () Bool)

(declare-fun b_next!29935 () Bool)

(assert (=> start!111100 (= b_free!29935 (not b_next!29935))))

(declare-fun tp!105127 () Bool)

(declare-fun b_and!48143 () Bool)

(assert (=> start!111100 (= tp!105127 b_and!48143)))

(declare-fun b!1315430 () Bool)

(declare-fun res!873267 () Bool)

(declare-fun e!750375 () Bool)

(assert (=> b!1315430 (=> (not res!873267) (not e!750375))))

(declare-datatypes ((array!88292 0))(
  ( (array!88293 (arr!42626 (Array (_ BitVec 32) (_ BitVec 64))) (size!43176 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88292)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88292 (_ BitVec 32)) Bool)

(assert (=> b!1315430 (= res!873267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55126 () Bool)

(declare-fun mapRes!55126 () Bool)

(assert (=> mapIsEmpty!55126 mapRes!55126))

(declare-fun b!1315431 () Bool)

(declare-fun res!873266 () Bool)

(assert (=> b!1315431 (=> (not res!873266) (not e!750375))))

(declare-datatypes ((List!30237 0))(
  ( (Nil!30234) (Cons!30233 (h!31442 (_ BitVec 64)) (t!43843 List!30237)) )
))
(declare-fun arrayNoDuplicates!0 (array!88292 (_ BitVec 32) List!30237) Bool)

(assert (=> b!1315431 (= res!873266 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30234))))

(declare-fun b!1315432 () Bool)

(declare-fun res!873270 () Bool)

(assert (=> b!1315432 (=> (not res!873270) (not e!750375))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315432 (= res!873270 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43176 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873269 () Bool)

(assert (=> start!111100 (=> (not res!873269) (not e!750375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111100 (= res!873269 (validMask!0 mask!2040))))

(assert (=> start!111100 e!750375))

(assert (=> start!111100 tp!105127))

(declare-fun array_inv!32195 (array!88292) Bool)

(assert (=> start!111100 (array_inv!32195 _keys!1628)))

(assert (=> start!111100 true))

(declare-fun tp_is_empty!35665 () Bool)

(assert (=> start!111100 tp_is_empty!35665))

(declare-datatypes ((V!52657 0))(
  ( (V!52658 (val!17907 Int)) )
))
(declare-datatypes ((ValueCell!16934 0))(
  ( (ValueCellFull!16934 (v!20534 V!52657)) (EmptyCell!16934) )
))
(declare-datatypes ((array!88294 0))(
  ( (array!88295 (arr!42627 (Array (_ BitVec 32) ValueCell!16934)) (size!43177 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88294)

(declare-fun e!750373 () Bool)

(declare-fun array_inv!32196 (array!88294) Bool)

(assert (=> start!111100 (and (array_inv!32196 _values!1354) e!750373)))

(declare-fun b!1315433 () Bool)

(assert (=> b!1315433 (= e!750375 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52657)

(declare-fun zeroValue!1296 () V!52657)

(declare-fun lt!585912 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23102 0))(
  ( (tuple2!23103 (_1!11562 (_ BitVec 64)) (_2!11562 V!52657)) )
))
(declare-datatypes ((List!30238 0))(
  ( (Nil!30235) (Cons!30234 (h!31443 tuple2!23102) (t!43844 List!30238)) )
))
(declare-datatypes ((ListLongMap!20759 0))(
  ( (ListLongMap!20760 (toList!10395 List!30238)) )
))
(declare-fun contains!8545 (ListLongMap!20759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5408 (array!88292 array!88294 (_ BitVec 32) (_ BitVec 32) V!52657 V!52657 (_ BitVec 32) Int) ListLongMap!20759)

(assert (=> b!1315433 (= lt!585912 (contains!8545 (getCurrentListMap!5408 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!55126 () Bool)

(declare-fun tp!105126 () Bool)

(declare-fun e!750376 () Bool)

(assert (=> mapNonEmpty!55126 (= mapRes!55126 (and tp!105126 e!750376))))

(declare-fun mapRest!55126 () (Array (_ BitVec 32) ValueCell!16934))

(declare-fun mapValue!55126 () ValueCell!16934)

(declare-fun mapKey!55126 () (_ BitVec 32))

(assert (=> mapNonEmpty!55126 (= (arr!42627 _values!1354) (store mapRest!55126 mapKey!55126 mapValue!55126))))

(declare-fun b!1315434 () Bool)

(declare-fun res!873268 () Bool)

(assert (=> b!1315434 (=> (not res!873268) (not e!750375))))

(assert (=> b!1315434 (= res!873268 (and (= (size!43177 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43176 _keys!1628) (size!43177 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315435 () Bool)

(declare-fun e!750374 () Bool)

(assert (=> b!1315435 (= e!750373 (and e!750374 mapRes!55126))))

(declare-fun condMapEmpty!55126 () Bool)

(declare-fun mapDefault!55126 () ValueCell!16934)

