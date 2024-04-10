; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20148 () Bool)

(assert start!20148)

(declare-fun b_free!4807 () Bool)

(declare-fun b_next!4807 () Bool)

(assert (=> start!20148 (= b_free!4807 (not b_next!4807))))

(declare-fun tp!17452 () Bool)

(declare-fun b_and!11553 () Bool)

(assert (=> start!20148 (= tp!17452 b_and!11553)))

(declare-fun b!197654 () Bool)

(declare-fun res!93538 () Bool)

(declare-fun e!130031 () Bool)

(assert (=> b!197654 (=> (not res!93538) (not e!130031))))

(declare-datatypes ((array!8579 0))(
  ( (array!8580 (arr!4040 (Array (_ BitVec 32) (_ BitVec 64))) (size!4365 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8579)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!197654 (= res!93538 (= (select (arr!4040 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8063 () Bool)

(declare-fun mapRes!8063 () Bool)

(declare-fun tp!17453 () Bool)

(declare-fun e!130030 () Bool)

(assert (=> mapNonEmpty!8063 (= mapRes!8063 (and tp!17453 e!130030))))

(declare-datatypes ((V!5865 0))(
  ( (V!5866 (val!2376 Int)) )
))
(declare-datatypes ((ValueCell!1988 0))(
  ( (ValueCellFull!1988 (v!4346 V!5865)) (EmptyCell!1988) )
))
(declare-fun mapValue!8063 () ValueCell!1988)

(declare-datatypes ((array!8581 0))(
  ( (array!8582 (arr!4041 (Array (_ BitVec 32) ValueCell!1988)) (size!4366 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8581)

(declare-fun mapKey!8063 () (_ BitVec 32))

(declare-fun mapRest!8063 () (Array (_ BitVec 32) ValueCell!1988))

(assert (=> mapNonEmpty!8063 (= (arr!4041 _values!649) (store mapRest!8063 mapKey!8063 mapValue!8063))))

(declare-fun b!197655 () Bool)

(declare-fun res!93539 () Bool)

(assert (=> b!197655 (=> (not res!93539) (not e!130031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197655 (= res!93539 (validKeyInArray!0 k!843))))

(declare-fun b!197656 () Bool)

(declare-fun res!93542 () Bool)

(assert (=> b!197656 (=> (not res!93542) (not e!130031))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8579 (_ BitVec 32)) Bool)

(assert (=> b!197656 (= res!93542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197657 () Bool)

(assert (=> b!197657 (= e!130031 false)))

(declare-datatypes ((tuple2!3608 0))(
  ( (tuple2!3609 (_1!1815 (_ BitVec 64)) (_2!1815 V!5865)) )
))
(declare-datatypes ((List!2522 0))(
  ( (Nil!2519) (Cons!2518 (h!3160 tuple2!3608) (t!7453 List!2522)) )
))
(declare-datatypes ((ListLongMap!2521 0))(
  ( (ListLongMap!2522 (toList!1276 List!2522)) )
))
(declare-fun lt!97761 () ListLongMap!2521)

(declare-fun v!520 () V!5865)

(declare-fun zeroValue!615 () V!5865)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5865)

(declare-fun getCurrentListMapNoExtraKeys!241 (array!8579 array!8581 (_ BitVec 32) (_ BitVec 32) V!5865 V!5865 (_ BitVec 32) Int) ListLongMap!2521)

(assert (=> b!197657 (= lt!97761 (getCurrentListMapNoExtraKeys!241 _keys!825 (array!8582 (store (arr!4041 _values!649) i!601 (ValueCellFull!1988 v!520)) (size!4366 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97760 () ListLongMap!2521)

(assert (=> b!197657 (= lt!97760 (getCurrentListMapNoExtraKeys!241 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197658 () Bool)

(declare-fun res!93540 () Bool)

(assert (=> b!197658 (=> (not res!93540) (not e!130031))))

(declare-datatypes ((List!2523 0))(
  ( (Nil!2520) (Cons!2519 (h!3161 (_ BitVec 64)) (t!7454 List!2523)) )
))
(declare-fun arrayNoDuplicates!0 (array!8579 (_ BitVec 32) List!2523) Bool)

(assert (=> b!197658 (= res!93540 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2520))))

(declare-fun b!197659 () Bool)

(declare-fun res!93544 () Bool)

(assert (=> b!197659 (=> (not res!93544) (not e!130031))))

(assert (=> b!197659 (= res!93544 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4365 _keys!825))))))

(declare-fun b!197660 () Bool)

(declare-fun res!93543 () Bool)

(assert (=> b!197660 (=> (not res!93543) (not e!130031))))

(assert (=> b!197660 (= res!93543 (and (= (size!4366 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4365 _keys!825) (size!4366 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197661 () Bool)

(declare-fun tp_is_empty!4663 () Bool)

(assert (=> b!197661 (= e!130030 tp_is_empty!4663)))

(declare-fun mapIsEmpty!8063 () Bool)

(assert (=> mapIsEmpty!8063 mapRes!8063))

(declare-fun b!197663 () Bool)

(declare-fun e!130032 () Bool)

(declare-fun e!130034 () Bool)

(assert (=> b!197663 (= e!130032 (and e!130034 mapRes!8063))))

(declare-fun condMapEmpty!8063 () Bool)

(declare-fun mapDefault!8063 () ValueCell!1988)

