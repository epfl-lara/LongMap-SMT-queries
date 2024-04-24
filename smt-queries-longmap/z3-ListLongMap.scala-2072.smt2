; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35586 () Bool)

(assert start!35586)

(declare-fun b!357034 () Bool)

(declare-fun e!218658 () Bool)

(declare-fun tp_is_empty!8053 () Bool)

(assert (=> b!357034 (= e!218658 tp_is_empty!8053)))

(declare-fun b!357035 () Bool)

(declare-fun e!218659 () Bool)

(declare-fun mapRes!13587 () Bool)

(assert (=> b!357035 (= e!218659 (and e!218658 mapRes!13587))))

(declare-fun condMapEmpty!13587 () Bool)

(declare-datatypes ((V!11715 0))(
  ( (V!11716 (val!4071 Int)) )
))
(declare-datatypes ((ValueCell!3683 0))(
  ( (ValueCellFull!3683 (v!6266 V!11715)) (EmptyCell!3683) )
))
(declare-datatypes ((array!19658 0))(
  ( (array!19659 (arr!9322 (Array (_ BitVec 32) ValueCell!3683)) (size!9674 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19658)

(declare-fun mapDefault!13587 () ValueCell!3683)

(assert (=> b!357035 (= condMapEmpty!13587 (= (arr!9322 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3683)) mapDefault!13587)))))

(declare-fun b!357036 () Bool)

(declare-fun e!218661 () Bool)

(assert (=> b!357036 (= e!218661 tp_is_empty!8053)))

(declare-fun b!357037 () Bool)

(declare-fun res!198250 () Bool)

(declare-fun e!218660 () Bool)

(assert (=> b!357037 (=> (not res!198250) (not e!218660))))

(declare-datatypes ((array!19660 0))(
  ( (array!19661 (arr!9323 (Array (_ BitVec 32) (_ BitVec 64))) (size!9675 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19660)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357037 (= res!198250 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357038 () Bool)

(declare-fun res!198253 () Bool)

(assert (=> b!357038 (=> (not res!198253) (not e!218660))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19660 (_ BitVec 32)) Bool)

(assert (=> b!357038 (= res!198253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357039 () Bool)

(assert (=> b!357039 (= e!218660 (not true))))

(assert (=> b!357039 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!10987 0))(
  ( (Unit!10988) )
))
(declare-fun lt!166013 () Unit!10987)

(declare-fun minValue!1150 () V!11715)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11715)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 (array!19660 array!19658 (_ BitVec 32) (_ BitVec 32) V!11715 V!11715 (_ BitVec 64) (_ BitVec 32)) Unit!10987)

(assert (=> b!357039 (= lt!166013 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357040 () Bool)

(declare-fun res!198254 () Bool)

(assert (=> b!357040 (=> (not res!198254) (not e!218660))))

(assert (=> b!357040 (= res!198254 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9675 _keys!1456))))))

(declare-fun b!357041 () Bool)

(declare-fun res!198249 () Bool)

(assert (=> b!357041 (=> (not res!198249) (not e!218660))))

(assert (=> b!357041 (= res!198249 (not (= (select (arr!9323 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357042 () Bool)

(declare-fun res!198252 () Bool)

(assert (=> b!357042 (=> (not res!198252) (not e!218660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357042 (= res!198252 (validKeyInArray!0 k0!1077))))

(declare-fun b!357043 () Bool)

(declare-fun res!198255 () Bool)

(assert (=> b!357043 (=> (not res!198255) (not e!218660))))

(assert (=> b!357043 (= res!198255 (and (= (size!9674 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9675 _keys!1456) (size!9674 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13587 () Bool)

(declare-fun tp!27564 () Bool)

(assert (=> mapNonEmpty!13587 (= mapRes!13587 (and tp!27564 e!218661))))

(declare-fun mapRest!13587 () (Array (_ BitVec 32) ValueCell!3683))

(declare-fun mapValue!13587 () ValueCell!3683)

(declare-fun mapKey!13587 () (_ BitVec 32))

(assert (=> mapNonEmpty!13587 (= (arr!9322 _values!1208) (store mapRest!13587 mapKey!13587 mapValue!13587))))

(declare-fun mapIsEmpty!13587 () Bool)

(assert (=> mapIsEmpty!13587 mapRes!13587))

(declare-fun res!198256 () Bool)

(assert (=> start!35586 (=> (not res!198256) (not e!218660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35586 (= res!198256 (validMask!0 mask!1842))))

(assert (=> start!35586 e!218660))

(assert (=> start!35586 tp_is_empty!8053))

(assert (=> start!35586 true))

(declare-fun array_inv!6888 (array!19660) Bool)

(assert (=> start!35586 (array_inv!6888 _keys!1456)))

(declare-fun array_inv!6889 (array!19658) Bool)

(assert (=> start!35586 (and (array_inv!6889 _values!1208) e!218659)))

(declare-fun b!357044 () Bool)

(declare-fun res!198251 () Bool)

(assert (=> b!357044 (=> (not res!198251) (not e!218660))))

(declare-datatypes ((List!5292 0))(
  ( (Nil!5289) (Cons!5288 (h!6144 (_ BitVec 64)) (t!10434 List!5292)) )
))
(declare-fun arrayNoDuplicates!0 (array!19660 (_ BitVec 32) List!5292) Bool)

(assert (=> b!357044 (= res!198251 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5289))))

(assert (= (and start!35586 res!198256) b!357043))

(assert (= (and b!357043 res!198255) b!357038))

(assert (= (and b!357038 res!198253) b!357044))

(assert (= (and b!357044 res!198251) b!357042))

(assert (= (and b!357042 res!198252) b!357040))

(assert (= (and b!357040 res!198254) b!357037))

(assert (= (and b!357037 res!198250) b!357041))

(assert (= (and b!357041 res!198249) b!357039))

(assert (= (and b!357035 condMapEmpty!13587) mapIsEmpty!13587))

(assert (= (and b!357035 (not condMapEmpty!13587)) mapNonEmpty!13587))

(get-info :version)

(assert (= (and mapNonEmpty!13587 ((_ is ValueCellFull!3683) mapValue!13587)) b!357036))

(assert (= (and b!357035 ((_ is ValueCellFull!3683) mapDefault!13587)) b!357034))

(assert (= start!35586 b!357035))

(declare-fun m!355491 () Bool)

(assert (=> mapNonEmpty!13587 m!355491))

(declare-fun m!355493 () Bool)

(assert (=> b!357044 m!355493))

(declare-fun m!355495 () Bool)

(assert (=> b!357042 m!355495))

(declare-fun m!355497 () Bool)

(assert (=> b!357041 m!355497))

(declare-fun m!355499 () Bool)

(assert (=> start!35586 m!355499))

(declare-fun m!355501 () Bool)

(assert (=> start!35586 m!355501))

(declare-fun m!355503 () Bool)

(assert (=> start!35586 m!355503))

(declare-fun m!355505 () Bool)

(assert (=> b!357039 m!355505))

(declare-fun m!355507 () Bool)

(assert (=> b!357039 m!355507))

(declare-fun m!355509 () Bool)

(assert (=> b!357038 m!355509))

(declare-fun m!355511 () Bool)

(assert (=> b!357037 m!355511))

(check-sat tp_is_empty!8053 (not start!35586) (not b!357042) (not b!357044) (not b!357038) (not mapNonEmpty!13587) (not b!357039) (not b!357037))
(check-sat)
