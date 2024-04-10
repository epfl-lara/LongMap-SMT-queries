; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35858 () Bool)

(assert start!35858)

(declare-fun b!360480 () Bool)

(declare-fun e!220710 () Bool)

(declare-fun tp_is_empty!8311 () Bool)

(assert (=> b!360480 (= e!220710 tp_is_empty!8311)))

(declare-fun b!360481 () Bool)

(declare-fun res!200486 () Bool)

(declare-fun e!220712 () Bool)

(assert (=> b!360481 (=> (not res!200486) (not e!220712))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20173 0))(
  ( (array!20174 (arr!9580 (Array (_ BitVec 32) (_ BitVec 64))) (size!9932 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20173)

(assert (=> b!360481 (= res!200486 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9932 _keys!1456))))))

(declare-fun mapIsEmpty!13974 () Bool)

(declare-fun mapRes!13974 () Bool)

(assert (=> mapIsEmpty!13974 mapRes!13974))

(declare-fun b!360482 () Bool)

(declare-fun e!220708 () Bool)

(assert (=> b!360482 (= e!220708 tp_is_empty!8311)))

(declare-fun b!360484 () Bool)

(declare-fun res!200488 () Bool)

(assert (=> b!360484 (=> (not res!200488) (not e!220712))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12059 0))(
  ( (V!12060 (val!4200 Int)) )
))
(declare-datatypes ((ValueCell!3812 0))(
  ( (ValueCellFull!3812 (v!6394 V!12059)) (EmptyCell!3812) )
))
(declare-datatypes ((array!20175 0))(
  ( (array!20176 (arr!9581 (Array (_ BitVec 32) ValueCell!3812)) (size!9933 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20175)

(assert (=> b!360484 (= res!200488 (and (= (size!9933 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9932 _keys!1456) (size!9933 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360485 () Bool)

(declare-fun res!200489 () Bool)

(assert (=> b!360485 (=> (not res!200489) (not e!220712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20173 (_ BitVec 32)) Bool)

(assert (=> b!360485 (= res!200489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360486 () Bool)

(declare-fun res!200484 () Bool)

(assert (=> b!360486 (=> (not res!200484) (not e!220712))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!360486 (= res!200484 (not (= (select (arr!9580 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13974 () Bool)

(declare-fun tp!28041 () Bool)

(assert (=> mapNonEmpty!13974 (= mapRes!13974 (and tp!28041 e!220708))))

(declare-fun mapValue!13974 () ValueCell!3812)

(declare-fun mapKey!13974 () (_ BitVec 32))

(declare-fun mapRest!13974 () (Array (_ BitVec 32) ValueCell!3812))

(assert (=> mapNonEmpty!13974 (= (arr!9581 _values!1208) (store mapRest!13974 mapKey!13974 mapValue!13974))))

(declare-fun b!360483 () Bool)

(declare-fun res!200491 () Bool)

(assert (=> b!360483 (=> (not res!200491) (not e!220712))))

(declare-fun arrayContainsKey!0 (array!20173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360483 (= res!200491 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!200487 () Bool)

(assert (=> start!35858 (=> (not res!200487) (not e!220712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35858 (= res!200487 (validMask!0 mask!1842))))

(assert (=> start!35858 e!220712))

(assert (=> start!35858 tp_is_empty!8311))

(assert (=> start!35858 true))

(declare-fun array_inv!7048 (array!20173) Bool)

(assert (=> start!35858 (array_inv!7048 _keys!1456)))

(declare-fun e!220709 () Bool)

(declare-fun array_inv!7049 (array!20175) Bool)

(assert (=> start!35858 (and (array_inv!7049 _values!1208) e!220709)))

(declare-fun b!360487 () Bool)

(declare-fun res!200490 () Bool)

(assert (=> b!360487 (=> (not res!200490) (not e!220712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360487 (= res!200490 (validKeyInArray!0 k!1077))))

(declare-fun b!360488 () Bool)

(assert (=> b!360488 (= e!220709 (and e!220710 mapRes!13974))))

(declare-fun condMapEmpty!13974 () Bool)

(declare-fun mapDefault!13974 () ValueCell!3812)

