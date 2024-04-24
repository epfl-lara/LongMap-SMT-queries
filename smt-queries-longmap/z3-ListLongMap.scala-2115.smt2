; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35844 () Bool)

(assert start!35844)

(declare-fun b!360427 () Bool)

(declare-fun res!200483 () Bool)

(declare-fun e!220678 () Bool)

(assert (=> b!360427 (=> (not res!200483) (not e!220678))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20152 0))(
  ( (array!20153 (arr!9569 (Array (_ BitVec 32) (_ BitVec 64))) (size!9921 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20152)

(declare-datatypes ((V!12059 0))(
  ( (V!12060 (val!4200 Int)) )
))
(declare-datatypes ((ValueCell!3812 0))(
  ( (ValueCellFull!3812 (v!6395 V!12059)) (EmptyCell!3812) )
))
(declare-datatypes ((array!20154 0))(
  ( (array!20155 (arr!9570 (Array (_ BitVec 32) ValueCell!3812)) (size!9922 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20154)

(assert (=> b!360427 (= res!200483 (and (= (size!9922 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9921 _keys!1456) (size!9922 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360428 () Bool)

(assert (=> b!360428 (= e!220678 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360428 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12059)

(declare-datatypes ((Unit!11079 0))(
  ( (Unit!11080) )
))
(declare-fun lt!166472 () Unit!11079)

(declare-fun zeroValue!1150 () V!12059)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!61 (array!20152 array!20154 (_ BitVec 32) (_ BitVec 32) V!12059 V!12059 (_ BitVec 64) (_ BitVec 32)) Unit!11079)

(assert (=> b!360428 (= lt!166472 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!61 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360429 () Bool)

(declare-fun res!200481 () Bool)

(assert (=> b!360429 (=> (not res!200481) (not e!220678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20152 (_ BitVec 32)) Bool)

(assert (=> b!360429 (= res!200481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!200485 () Bool)

(assert (=> start!35844 (=> (not res!200485) (not e!220678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35844 (= res!200485 (validMask!0 mask!1842))))

(assert (=> start!35844 e!220678))

(declare-fun tp_is_empty!8311 () Bool)

(assert (=> start!35844 tp_is_empty!8311))

(assert (=> start!35844 true))

(declare-fun array_inv!7074 (array!20152) Bool)

(assert (=> start!35844 (array_inv!7074 _keys!1456)))

(declare-fun e!220674 () Bool)

(declare-fun array_inv!7075 (array!20154) Bool)

(assert (=> start!35844 (and (array_inv!7075 _values!1208) e!220674)))

(declare-fun mapIsEmpty!13974 () Bool)

(declare-fun mapRes!13974 () Bool)

(assert (=> mapIsEmpty!13974 mapRes!13974))

(declare-fun b!360430 () Bool)

(declare-fun e!220677 () Bool)

(assert (=> b!360430 (= e!220677 tp_is_empty!8311)))

(declare-fun b!360431 () Bool)

(declare-fun res!200482 () Bool)

(assert (=> b!360431 (=> (not res!200482) (not e!220678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360431 (= res!200482 (validKeyInArray!0 k0!1077))))

(declare-fun b!360432 () Bool)

(declare-fun res!200488 () Bool)

(assert (=> b!360432 (=> (not res!200488) (not e!220678))))

(assert (=> b!360432 (= res!200488 (not (= (select (arr!9569 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360433 () Bool)

(declare-fun res!200484 () Bool)

(assert (=> b!360433 (=> (not res!200484) (not e!220678))))

(declare-datatypes ((List!5403 0))(
  ( (Nil!5400) (Cons!5399 (h!6255 (_ BitVec 64)) (t!10545 List!5403)) )
))
(declare-fun arrayNoDuplicates!0 (array!20152 (_ BitVec 32) List!5403) Bool)

(assert (=> b!360433 (= res!200484 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5400))))

(declare-fun b!360434 () Bool)

(declare-fun e!220676 () Bool)

(assert (=> b!360434 (= e!220676 tp_is_empty!8311)))

(declare-fun b!360435 () Bool)

(declare-fun res!200487 () Bool)

(assert (=> b!360435 (=> (not res!200487) (not e!220678))))

(assert (=> b!360435 (= res!200487 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360436 () Bool)

(assert (=> b!360436 (= e!220674 (and e!220677 mapRes!13974))))

(declare-fun condMapEmpty!13974 () Bool)

(declare-fun mapDefault!13974 () ValueCell!3812)

(assert (=> b!360436 (= condMapEmpty!13974 (= (arr!9570 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3812)) mapDefault!13974)))))

(declare-fun mapNonEmpty!13974 () Bool)

(declare-fun tp!28041 () Bool)

(assert (=> mapNonEmpty!13974 (= mapRes!13974 (and tp!28041 e!220676))))

(declare-fun mapRest!13974 () (Array (_ BitVec 32) ValueCell!3812))

(declare-fun mapValue!13974 () ValueCell!3812)

(declare-fun mapKey!13974 () (_ BitVec 32))

(assert (=> mapNonEmpty!13974 (= (arr!9570 _values!1208) (store mapRest!13974 mapKey!13974 mapValue!13974))))

(declare-fun b!360437 () Bool)

(declare-fun res!200486 () Bool)

(assert (=> b!360437 (=> (not res!200486) (not e!220678))))

(assert (=> b!360437 (= res!200486 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9921 _keys!1456))))))

(assert (= (and start!35844 res!200485) b!360427))

(assert (= (and b!360427 res!200483) b!360429))

(assert (= (and b!360429 res!200481) b!360433))

(assert (= (and b!360433 res!200484) b!360431))

(assert (= (and b!360431 res!200482) b!360437))

(assert (= (and b!360437 res!200486) b!360435))

(assert (= (and b!360435 res!200487) b!360432))

(assert (= (and b!360432 res!200488) b!360428))

(assert (= (and b!360436 condMapEmpty!13974) mapIsEmpty!13974))

(assert (= (and b!360436 (not condMapEmpty!13974)) mapNonEmpty!13974))

(get-info :version)

(assert (= (and mapNonEmpty!13974 ((_ is ValueCellFull!3812) mapValue!13974)) b!360434))

(assert (= (and b!360436 ((_ is ValueCellFull!3812) mapDefault!13974)) b!360430))

(assert (= start!35844 b!360436))

(declare-fun m!357855 () Bool)

(assert (=> b!360431 m!357855))

(declare-fun m!357857 () Bool)

(assert (=> b!360435 m!357857))

(declare-fun m!357859 () Bool)

(assert (=> b!360432 m!357859))

(declare-fun m!357861 () Bool)

(assert (=> b!360428 m!357861))

(declare-fun m!357863 () Bool)

(assert (=> b!360428 m!357863))

(declare-fun m!357865 () Bool)

(assert (=> mapNonEmpty!13974 m!357865))

(declare-fun m!357867 () Bool)

(assert (=> b!360429 m!357867))

(declare-fun m!357869 () Bool)

(assert (=> b!360433 m!357869))

(declare-fun m!357871 () Bool)

(assert (=> start!35844 m!357871))

(declare-fun m!357873 () Bool)

(assert (=> start!35844 m!357873))

(declare-fun m!357875 () Bool)

(assert (=> start!35844 m!357875))

(check-sat (not b!360429) (not b!360433) (not b!360435) (not b!360428) (not mapNonEmpty!13974) tp_is_empty!8311 (not b!360431) (not start!35844))
(check-sat)
