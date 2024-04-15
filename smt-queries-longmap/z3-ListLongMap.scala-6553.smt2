; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83184 () Bool)

(assert start!83184)

(declare-fun b_free!19195 () Bool)

(declare-fun b_next!19195 () Bool)

(assert (=> start!83184 (= b_free!19195 (not b_next!19195))))

(declare-fun tp!66864 () Bool)

(declare-fun b_and!30657 () Bool)

(assert (=> start!83184 (= tp!66864 b_and!30657)))

(declare-fun mapIsEmpty!35149 () Bool)

(declare-fun mapRes!35149 () Bool)

(assert (=> mapIsEmpty!35149 mapRes!35149))

(declare-fun b!970497 () Bool)

(declare-fun res!649620 () Bool)

(declare-fun e!547114 () Bool)

(assert (=> b!970497 (=> (not res!649620) (not e!547114))))

(declare-datatypes ((array!60174 0))(
  ( (array!60175 (arr!28951 (Array (_ BitVec 32) (_ BitVec 64))) (size!29432 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60174)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60174 (_ BitVec 32)) Bool)

(assert (=> b!970497 (= res!649620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970498 () Bool)

(declare-fun e!547113 () Bool)

(declare-fun e!547116 () Bool)

(assert (=> b!970498 (= e!547113 (and e!547116 mapRes!35149))))

(declare-fun condMapEmpty!35149 () Bool)

(declare-datatypes ((V!34441 0))(
  ( (V!34442 (val!11097 Int)) )
))
(declare-datatypes ((ValueCell!10565 0))(
  ( (ValueCellFull!10565 (v!13655 V!34441)) (EmptyCell!10565) )
))
(declare-datatypes ((array!60176 0))(
  ( (array!60177 (arr!28952 (Array (_ BitVec 32) ValueCell!10565)) (size!29433 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60176)

(declare-fun mapDefault!35149 () ValueCell!10565)

(assert (=> b!970498 (= condMapEmpty!35149 (= (arr!28952 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10565)) mapDefault!35149)))))

(declare-fun res!649616 () Bool)

(assert (=> start!83184 (=> (not res!649616) (not e!547114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83184 (= res!649616 (validMask!0 mask!2147))))

(assert (=> start!83184 e!547114))

(assert (=> start!83184 true))

(declare-fun array_inv!22473 (array!60176) Bool)

(assert (=> start!83184 (and (array_inv!22473 _values!1425) e!547113)))

(declare-fun tp_is_empty!22093 () Bool)

(assert (=> start!83184 tp_is_empty!22093))

(assert (=> start!83184 tp!66864))

(declare-fun array_inv!22474 (array!60174) Bool)

(assert (=> start!83184 (array_inv!22474 _keys!1717)))

(declare-fun b!970499 () Bool)

(assert (=> b!970499 (= e!547116 tp_is_empty!22093)))

(declare-fun b!970500 () Bool)

(assert (=> b!970500 (= e!547114 false)))

(declare-fun lt!431535 () Bool)

(declare-fun zeroValue!1367 () V!34441)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34441)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14300 0))(
  ( (tuple2!14301 (_1!7161 (_ BitVec 64)) (_2!7161 V!34441)) )
))
(declare-datatypes ((List!20122 0))(
  ( (Nil!20119) (Cons!20118 (h!21280 tuple2!14300) (t!28476 List!20122)) )
))
(declare-datatypes ((ListLongMap!12987 0))(
  ( (ListLongMap!12988 (toList!6509 List!20122)) )
))
(declare-fun contains!5557 (ListLongMap!12987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3671 (array!60174 array!60176 (_ BitVec 32) (_ BitVec 32) V!34441 V!34441 (_ BitVec 32) Int) ListLongMap!12987)

(assert (=> b!970500 (= lt!431535 (contains!5557 (getCurrentListMap!3671 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28951 _keys!1717) i!822)))))

(declare-fun b!970501 () Bool)

(declare-fun res!649621 () Bool)

(assert (=> b!970501 (=> (not res!649621) (not e!547114))))

(assert (=> b!970501 (= res!649621 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29432 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29432 _keys!1717))))))

(declare-fun mapNonEmpty!35149 () Bool)

(declare-fun tp!66865 () Bool)

(declare-fun e!547112 () Bool)

(assert (=> mapNonEmpty!35149 (= mapRes!35149 (and tp!66865 e!547112))))

(declare-fun mapValue!35149 () ValueCell!10565)

(declare-fun mapRest!35149 () (Array (_ BitVec 32) ValueCell!10565))

(declare-fun mapKey!35149 () (_ BitVec 32))

(assert (=> mapNonEmpty!35149 (= (arr!28952 _values!1425) (store mapRest!35149 mapKey!35149 mapValue!35149))))

(declare-fun b!970502 () Bool)

(declare-fun res!649618 () Bool)

(assert (=> b!970502 (=> (not res!649618) (not e!547114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970502 (= res!649618 (validKeyInArray!0 (select (arr!28951 _keys!1717) i!822)))))

(declare-fun b!970503 () Bool)

(declare-fun res!649619 () Bool)

(assert (=> b!970503 (=> (not res!649619) (not e!547114))))

(assert (=> b!970503 (= res!649619 (and (= (size!29433 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29432 _keys!1717) (size!29433 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970504 () Bool)

(assert (=> b!970504 (= e!547112 tp_is_empty!22093)))

(declare-fun b!970505 () Bool)

(declare-fun res!649617 () Bool)

(assert (=> b!970505 (=> (not res!649617) (not e!547114))))

(declare-datatypes ((List!20123 0))(
  ( (Nil!20120) (Cons!20119 (h!21281 (_ BitVec 64)) (t!28477 List!20123)) )
))
(declare-fun arrayNoDuplicates!0 (array!60174 (_ BitVec 32) List!20123) Bool)

(assert (=> b!970505 (= res!649617 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20120))))

(assert (= (and start!83184 res!649616) b!970503))

(assert (= (and b!970503 res!649619) b!970497))

(assert (= (and b!970497 res!649620) b!970505))

(assert (= (and b!970505 res!649617) b!970501))

(assert (= (and b!970501 res!649621) b!970502))

(assert (= (and b!970502 res!649618) b!970500))

(assert (= (and b!970498 condMapEmpty!35149) mapIsEmpty!35149))

(assert (= (and b!970498 (not condMapEmpty!35149)) mapNonEmpty!35149))

(get-info :version)

(assert (= (and mapNonEmpty!35149 ((_ is ValueCellFull!10565) mapValue!35149)) b!970504))

(assert (= (and b!970498 ((_ is ValueCellFull!10565) mapDefault!35149)) b!970499))

(assert (= start!83184 b!970498))

(declare-fun m!897629 () Bool)

(assert (=> b!970505 m!897629))

(declare-fun m!897631 () Bool)

(assert (=> start!83184 m!897631))

(declare-fun m!897633 () Bool)

(assert (=> start!83184 m!897633))

(declare-fun m!897635 () Bool)

(assert (=> start!83184 m!897635))

(declare-fun m!897637 () Bool)

(assert (=> b!970500 m!897637))

(declare-fun m!897639 () Bool)

(assert (=> b!970500 m!897639))

(assert (=> b!970500 m!897637))

(assert (=> b!970500 m!897639))

(declare-fun m!897641 () Bool)

(assert (=> b!970500 m!897641))

(declare-fun m!897643 () Bool)

(assert (=> mapNonEmpty!35149 m!897643))

(declare-fun m!897645 () Bool)

(assert (=> b!970497 m!897645))

(assert (=> b!970502 m!897639))

(assert (=> b!970502 m!897639))

(declare-fun m!897647 () Bool)

(assert (=> b!970502 m!897647))

(check-sat (not b!970502) tp_is_empty!22093 (not b_next!19195) (not start!83184) (not b!970497) b_and!30657 (not b!970500) (not mapNonEmpty!35149) (not b!970505))
(check-sat b_and!30657 (not b_next!19195))
