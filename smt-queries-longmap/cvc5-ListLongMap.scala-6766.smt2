; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84892 () Bool)

(assert start!84892)

(declare-fun mapNonEmpty!37128 () Bool)

(declare-fun mapRes!37128 () Bool)

(declare-fun tp!70199 () Bool)

(declare-fun e!559581 () Bool)

(assert (=> mapNonEmpty!37128 (= mapRes!37128 (and tp!70199 e!559581))))

(declare-datatypes ((V!36145 0))(
  ( (V!36146 (val!11736 Int)) )
))
(declare-datatypes ((ValueCell!11204 0))(
  ( (ValueCellFull!11204 (v!14313 V!36145)) (EmptyCell!11204) )
))
(declare-fun mapValue!37128 () ValueCell!11204)

(declare-fun mapRest!37128 () (Array (_ BitVec 32) ValueCell!11204))

(declare-datatypes ((array!62711 0))(
  ( (array!62712 (arr!30200 (Array (_ BitVec 32) ValueCell!11204)) (size!30679 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62711)

(declare-fun mapKey!37128 () (_ BitVec 32))

(assert (=> mapNonEmpty!37128 (= (arr!30200 _values!1551) (store mapRest!37128 mapKey!37128 mapValue!37128))))

(declare-fun b!992031 () Bool)

(declare-fun e!559579 () Bool)

(declare-fun e!559580 () Bool)

(assert (=> b!992031 (= e!559579 e!559580)))

(declare-fun res!663064 () Bool)

(assert (=> b!992031 (=> (not res!663064) (not e!559580))))

(declare-datatypes ((SeekEntryResult!9218 0))(
  ( (MissingZero!9218 (index!39243 (_ BitVec 32))) (Found!9218 (index!39244 (_ BitVec 32))) (Intermediate!9218 (undefined!10030 Bool) (index!39245 (_ BitVec 32)) (x!86331 (_ BitVec 32))) (Undefined!9218) (MissingVacant!9218 (index!39246 (_ BitVec 32))) )
))
(declare-fun lt!440044 () SeekEntryResult!9218)

(assert (=> b!992031 (= res!663064 (is-Found!9218 lt!440044))))

(declare-fun k!1425 () (_ BitVec 64))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62713 0))(
  ( (array!62714 (arr!30201 (Array (_ BitVec 32) (_ BitVec 64))) (size!30680 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62713)

(declare-fun seekEntry!0 ((_ BitVec 64) array!62713 (_ BitVec 32)) SeekEntryResult!9218)

(assert (=> b!992031 (= lt!440044 (seekEntry!0 k!1425 _keys!1945 mask!2471))))

(declare-fun b!992032 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!992032 (= e!559580 (not (inRange!0 (index!39244 lt!440044) mask!2471)))))

(declare-fun b!992033 () Bool)

(declare-fun res!663061 () Bool)

(assert (=> b!992033 (=> (not res!663061) (not e!559579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62713 (_ BitVec 32)) Bool)

(assert (=> b!992033 (= res!663061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992034 () Bool)

(declare-fun e!559577 () Bool)

(declare-fun e!559576 () Bool)

(assert (=> b!992034 (= e!559577 (and e!559576 mapRes!37128))))

(declare-fun condMapEmpty!37128 () Bool)

(declare-fun mapDefault!37128 () ValueCell!11204)

