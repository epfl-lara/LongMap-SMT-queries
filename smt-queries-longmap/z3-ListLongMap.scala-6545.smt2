; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83322 () Bool)

(assert start!83322)

(declare-fun b_free!19147 () Bool)

(declare-fun b_next!19147 () Bool)

(assert (=> start!83322 (= b_free!19147 (not b_next!19147))))

(declare-fun tp!66721 () Bool)

(declare-fun b_and!30645 () Bool)

(assert (=> start!83322 (= tp!66721 b_and!30645)))

(declare-fun b!970984 () Bool)

(declare-fun e!547483 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((array!60170 0))(
  ( (array!60171 (arr!28944 (Array (_ BitVec 32) (_ BitVec 64))) (size!29424 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60170)

(assert (=> b!970984 (= e!547483 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29424 _keys!1717))))))

(declare-fun b!970985 () Bool)

(declare-fun e!547485 () Bool)

(declare-fun tp_is_empty!22045 () Bool)

(assert (=> b!970985 (= e!547485 tp_is_empty!22045)))

(declare-fun b!970986 () Bool)

(declare-fun res!649636 () Bool)

(assert (=> b!970986 (=> (not res!649636) (not e!547483))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34377 0))(
  ( (V!34378 (val!11073 Int)) )
))
(declare-datatypes ((ValueCell!10541 0))(
  ( (ValueCellFull!10541 (v!13629 V!34377)) (EmptyCell!10541) )
))
(declare-datatypes ((array!60172 0))(
  ( (array!60173 (arr!28945 (Array (_ BitVec 32) ValueCell!10541)) (size!29425 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60172)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970986 (= res!649636 (and (= (size!29425 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29424 _keys!1717) (size!29425 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970987 () Bool)

(declare-fun res!649635 () Bool)

(assert (=> b!970987 (=> (not res!649635) (not e!547483))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970987 (= res!649635 (validKeyInArray!0 (select (arr!28944 _keys!1717) i!822)))))

(declare-fun res!649637 () Bool)

(assert (=> start!83322 (=> (not res!649637) (not e!547483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83322 (= res!649637 (validMask!0 mask!2147))))

(assert (=> start!83322 e!547483))

(assert (=> start!83322 true))

(declare-fun e!547484 () Bool)

(declare-fun array_inv!22455 (array!60172) Bool)

(assert (=> start!83322 (and (array_inv!22455 _values!1425) e!547484)))

(assert (=> start!83322 tp_is_empty!22045))

(assert (=> start!83322 tp!66721))

(declare-fun array_inv!22456 (array!60170) Bool)

(assert (=> start!83322 (array_inv!22456 _keys!1717)))

(declare-fun b!970988 () Bool)

(declare-fun res!649631 () Bool)

(assert (=> b!970988 (=> (not res!649631) (not e!547483))))

(assert (=> b!970988 (= res!649631 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29424 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29424 _keys!1717))))))

(declare-fun b!970989 () Bool)

(declare-fun mapRes!35077 () Bool)

(assert (=> b!970989 (= e!547484 (and e!547485 mapRes!35077))))

(declare-fun condMapEmpty!35077 () Bool)

(declare-fun mapDefault!35077 () ValueCell!10541)

(assert (=> b!970989 (= condMapEmpty!35077 (= (arr!28945 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10541)) mapDefault!35077)))))

(declare-fun b!970990 () Bool)

(declare-fun res!649633 () Bool)

(assert (=> b!970990 (=> (not res!649633) (not e!547483))))

(declare-datatypes ((List!20045 0))(
  ( (Nil!20042) (Cons!20041 (h!21209 (_ BitVec 64)) (t!28400 List!20045)) )
))
(declare-fun arrayNoDuplicates!0 (array!60170 (_ BitVec 32) List!20045) Bool)

(assert (=> b!970990 (= res!649633 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20042))))

(declare-fun mapNonEmpty!35077 () Bool)

(declare-fun tp!66720 () Bool)

(declare-fun e!547482 () Bool)

(assert (=> mapNonEmpty!35077 (= mapRes!35077 (and tp!66720 e!547482))))

(declare-fun mapRest!35077 () (Array (_ BitVec 32) ValueCell!10541))

(declare-fun mapValue!35077 () ValueCell!10541)

(declare-fun mapKey!35077 () (_ BitVec 32))

(assert (=> mapNonEmpty!35077 (= (arr!28945 _values!1425) (store mapRest!35077 mapKey!35077 mapValue!35077))))

(declare-fun b!970991 () Bool)

(assert (=> b!970991 (= e!547482 tp_is_empty!22045)))

(declare-fun b!970992 () Bool)

(declare-fun res!649634 () Bool)

(assert (=> b!970992 (=> (not res!649634) (not e!547483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60170 (_ BitVec 32)) Bool)

(assert (=> b!970992 (= res!649634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35077 () Bool)

(assert (=> mapIsEmpty!35077 mapRes!35077))

(declare-fun b!970993 () Bool)

(declare-fun res!649632 () Bool)

(assert (=> b!970993 (=> (not res!649632) (not e!547483))))

(declare-fun zeroValue!1367 () V!34377)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34377)

(declare-datatypes ((tuple2!14186 0))(
  ( (tuple2!14187 (_1!7104 (_ BitVec 64)) (_2!7104 V!34377)) )
))
(declare-datatypes ((List!20046 0))(
  ( (Nil!20043) (Cons!20042 (h!21210 tuple2!14186) (t!28401 List!20046)) )
))
(declare-datatypes ((ListLongMap!12885 0))(
  ( (ListLongMap!12886 (toList!6458 List!20046)) )
))
(declare-fun contains!5573 (ListLongMap!12885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3691 (array!60170 array!60172 (_ BitVec 32) (_ BitVec 32) V!34377 V!34377 (_ BitVec 32) Int) ListLongMap!12885)

(assert (=> b!970993 (= res!649632 (contains!5573 (getCurrentListMap!3691 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28944 _keys!1717) i!822)))))

(assert (= (and start!83322 res!649637) b!970986))

(assert (= (and b!970986 res!649636) b!970992))

(assert (= (and b!970992 res!649634) b!970990))

(assert (= (and b!970990 res!649633) b!970988))

(assert (= (and b!970988 res!649631) b!970987))

(assert (= (and b!970987 res!649635) b!970993))

(assert (= (and b!970993 res!649632) b!970984))

(assert (= (and b!970989 condMapEmpty!35077) mapIsEmpty!35077))

(assert (= (and b!970989 (not condMapEmpty!35077)) mapNonEmpty!35077))

(get-info :version)

(assert (= (and mapNonEmpty!35077 ((_ is ValueCellFull!10541) mapValue!35077)) b!970991))

(assert (= (and b!970989 ((_ is ValueCellFull!10541) mapDefault!35077)) b!970985))

(assert (= start!83322 b!970989))

(declare-fun m!899201 () Bool)

(assert (=> mapNonEmpty!35077 m!899201))

(declare-fun m!899203 () Bool)

(assert (=> b!970990 m!899203))

(declare-fun m!899205 () Bool)

(assert (=> b!970987 m!899205))

(assert (=> b!970987 m!899205))

(declare-fun m!899207 () Bool)

(assert (=> b!970987 m!899207))

(declare-fun m!899209 () Bool)

(assert (=> b!970993 m!899209))

(assert (=> b!970993 m!899205))

(assert (=> b!970993 m!899209))

(assert (=> b!970993 m!899205))

(declare-fun m!899211 () Bool)

(assert (=> b!970993 m!899211))

(declare-fun m!899213 () Bool)

(assert (=> start!83322 m!899213))

(declare-fun m!899215 () Bool)

(assert (=> start!83322 m!899215))

(declare-fun m!899217 () Bool)

(assert (=> start!83322 m!899217))

(declare-fun m!899219 () Bool)

(assert (=> b!970992 m!899219))

(check-sat tp_is_empty!22045 (not b!970990) (not start!83322) (not b!970993) b_and!30645 (not b_next!19147) (not b!970992) (not b!970987) (not mapNonEmpty!35077))
(check-sat b_and!30645 (not b_next!19147))
