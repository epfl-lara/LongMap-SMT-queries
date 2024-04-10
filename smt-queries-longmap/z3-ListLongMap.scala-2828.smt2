; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40934 () Bool)

(assert start!40934)

(declare-fun b_free!10869 () Bool)

(declare-fun b_next!10869 () Bool)

(assert (=> start!40934 (= b_free!10869 (not b_next!10869))))

(declare-fun tp!38433 () Bool)

(declare-fun b_and!19011 () Bool)

(assert (=> start!40934 (= tp!38433 b_and!19011)))

(declare-fun b!455177 () Bool)

(declare-fun res!271359 () Bool)

(declare-fun e!266179 () Bool)

(assert (=> b!455177 (=> (not res!271359) (not e!266179))))

(declare-datatypes ((array!28217 0))(
  ( (array!28218 (arr!13552 (Array (_ BitVec 32) (_ BitVec 64))) (size!13904 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28217)

(declare-datatypes ((List!8165 0))(
  ( (Nil!8162) (Cons!8161 (h!9017 (_ BitVec 64)) (t!13993 List!8165)) )
))
(declare-fun arrayNoDuplicates!0 (array!28217 (_ BitVec 32) List!8165) Bool)

(assert (=> b!455177 (= res!271359 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8162))))

(declare-fun b!455178 () Bool)

(declare-fun res!271365 () Bool)

(declare-fun e!266177 () Bool)

(assert (=> b!455178 (=> (not res!271365) (not e!266177))))

(declare-fun lt!206284 () array!28217)

(assert (=> b!455178 (= res!271365 (arrayNoDuplicates!0 lt!206284 #b00000000000000000000000000000000 Nil!8162))))

(declare-fun res!271357 () Bool)

(assert (=> start!40934 (=> (not res!271357) (not e!266179))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40934 (= res!271357 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13904 _keys!709))))))

(assert (=> start!40934 e!266179))

(declare-fun tp_is_empty!12207 () Bool)

(assert (=> start!40934 tp_is_empty!12207))

(assert (=> start!40934 tp!38433))

(assert (=> start!40934 true))

(declare-datatypes ((V!17381 0))(
  ( (V!17382 (val!6148 Int)) )
))
(declare-datatypes ((ValueCell!5760 0))(
  ( (ValueCellFull!5760 (v!8414 V!17381)) (EmptyCell!5760) )
))
(declare-datatypes ((array!28219 0))(
  ( (array!28220 (arr!13553 (Array (_ BitVec 32) ValueCell!5760)) (size!13905 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28219)

(declare-fun e!266178 () Bool)

(declare-fun array_inv!9818 (array!28219) Bool)

(assert (=> start!40934 (and (array_inv!9818 _values!549) e!266178)))

(declare-fun array_inv!9819 (array!28217) Bool)

(assert (=> start!40934 (array_inv!9819 _keys!709)))

(declare-fun b!455179 () Bool)

(assert (=> b!455179 (= e!266177 false)))

(declare-fun minValue!515 () V!17381)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17381)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17381)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8102 0))(
  ( (tuple2!8103 (_1!4062 (_ BitVec 64)) (_2!4062 V!17381)) )
))
(declare-datatypes ((List!8166 0))(
  ( (Nil!8163) (Cons!8162 (h!9018 tuple2!8102) (t!13994 List!8166)) )
))
(declare-datatypes ((ListLongMap!7015 0))(
  ( (ListLongMap!7016 (toList!3523 List!8166)) )
))
(declare-fun lt!206283 () ListLongMap!7015)

(declare-fun getCurrentListMapNoExtraKeys!1706 (array!28217 array!28219 (_ BitVec 32) (_ BitVec 32) V!17381 V!17381 (_ BitVec 32) Int) ListLongMap!7015)

(assert (=> b!455179 (= lt!206283 (getCurrentListMapNoExtraKeys!1706 lt!206284 (array!28220 (store (arr!13553 _values!549) i!563 (ValueCellFull!5760 v!412)) (size!13905 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206285 () ListLongMap!7015)

(assert (=> b!455179 (= lt!206285 (getCurrentListMapNoExtraKeys!1706 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455180 () Bool)

(declare-fun res!271366 () Bool)

(assert (=> b!455180 (=> (not res!271366) (not e!266179))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455180 (= res!271366 (validKeyInArray!0 k0!794))))

(declare-fun b!455181 () Bool)

(declare-fun res!271360 () Bool)

(assert (=> b!455181 (=> (not res!271360) (not e!266179))))

(assert (=> b!455181 (= res!271360 (or (= (select (arr!13552 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13552 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19951 () Bool)

(declare-fun mapRes!19951 () Bool)

(assert (=> mapIsEmpty!19951 mapRes!19951))

(declare-fun b!455182 () Bool)

(declare-fun e!266174 () Bool)

(assert (=> b!455182 (= e!266178 (and e!266174 mapRes!19951))))

(declare-fun condMapEmpty!19951 () Bool)

(declare-fun mapDefault!19951 () ValueCell!5760)

(assert (=> b!455182 (= condMapEmpty!19951 (= (arr!13553 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5760)) mapDefault!19951)))))

(declare-fun b!455183 () Bool)

(declare-fun res!271356 () Bool)

(assert (=> b!455183 (=> (not res!271356) (not e!266179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28217 (_ BitVec 32)) Bool)

(assert (=> b!455183 (= res!271356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455184 () Bool)

(assert (=> b!455184 (= e!266179 e!266177)))

(declare-fun res!271364 () Bool)

(assert (=> b!455184 (=> (not res!271364) (not e!266177))))

(assert (=> b!455184 (= res!271364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206284 mask!1025))))

(assert (=> b!455184 (= lt!206284 (array!28218 (store (arr!13552 _keys!709) i!563 k0!794) (size!13904 _keys!709)))))

(declare-fun mapNonEmpty!19951 () Bool)

(declare-fun tp!38434 () Bool)

(declare-fun e!266176 () Bool)

(assert (=> mapNonEmpty!19951 (= mapRes!19951 (and tp!38434 e!266176))))

(declare-fun mapValue!19951 () ValueCell!5760)

(declare-fun mapKey!19951 () (_ BitVec 32))

(declare-fun mapRest!19951 () (Array (_ BitVec 32) ValueCell!5760))

(assert (=> mapNonEmpty!19951 (= (arr!13553 _values!549) (store mapRest!19951 mapKey!19951 mapValue!19951))))

(declare-fun b!455185 () Bool)

(declare-fun res!271361 () Bool)

(assert (=> b!455185 (=> (not res!271361) (not e!266177))))

(assert (=> b!455185 (= res!271361 (bvsle from!863 i!563))))

(declare-fun b!455186 () Bool)

(assert (=> b!455186 (= e!266176 tp_is_empty!12207)))

(declare-fun b!455187 () Bool)

(declare-fun res!271367 () Bool)

(assert (=> b!455187 (=> (not res!271367) (not e!266179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455187 (= res!271367 (validMask!0 mask!1025))))

(declare-fun b!455188 () Bool)

(assert (=> b!455188 (= e!266174 tp_is_empty!12207)))

(declare-fun b!455189 () Bool)

(declare-fun res!271358 () Bool)

(assert (=> b!455189 (=> (not res!271358) (not e!266179))))

(declare-fun arrayContainsKey!0 (array!28217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455189 (= res!271358 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455190 () Bool)

(declare-fun res!271362 () Bool)

(assert (=> b!455190 (=> (not res!271362) (not e!266179))))

(assert (=> b!455190 (= res!271362 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13904 _keys!709))))))

(declare-fun b!455191 () Bool)

(declare-fun res!271363 () Bool)

(assert (=> b!455191 (=> (not res!271363) (not e!266179))))

(assert (=> b!455191 (= res!271363 (and (= (size!13905 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13904 _keys!709) (size!13905 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40934 res!271357) b!455187))

(assert (= (and b!455187 res!271367) b!455191))

(assert (= (and b!455191 res!271363) b!455183))

(assert (= (and b!455183 res!271356) b!455177))

(assert (= (and b!455177 res!271359) b!455190))

(assert (= (and b!455190 res!271362) b!455180))

(assert (= (and b!455180 res!271366) b!455181))

(assert (= (and b!455181 res!271360) b!455189))

(assert (= (and b!455189 res!271358) b!455184))

(assert (= (and b!455184 res!271364) b!455178))

(assert (= (and b!455178 res!271365) b!455185))

(assert (= (and b!455185 res!271361) b!455179))

(assert (= (and b!455182 condMapEmpty!19951) mapIsEmpty!19951))

(assert (= (and b!455182 (not condMapEmpty!19951)) mapNonEmpty!19951))

(get-info :version)

(assert (= (and mapNonEmpty!19951 ((_ is ValueCellFull!5760) mapValue!19951)) b!455186))

(assert (= (and b!455182 ((_ is ValueCellFull!5760) mapDefault!19951)) b!455188))

(assert (= start!40934 b!455182))

(declare-fun m!439051 () Bool)

(assert (=> start!40934 m!439051))

(declare-fun m!439053 () Bool)

(assert (=> start!40934 m!439053))

(declare-fun m!439055 () Bool)

(assert (=> b!455181 m!439055))

(declare-fun m!439057 () Bool)

(assert (=> b!455178 m!439057))

(declare-fun m!439059 () Bool)

(assert (=> b!455187 m!439059))

(declare-fun m!439061 () Bool)

(assert (=> b!455184 m!439061))

(declare-fun m!439063 () Bool)

(assert (=> b!455184 m!439063))

(declare-fun m!439065 () Bool)

(assert (=> b!455179 m!439065))

(declare-fun m!439067 () Bool)

(assert (=> b!455179 m!439067))

(declare-fun m!439069 () Bool)

(assert (=> b!455179 m!439069))

(declare-fun m!439071 () Bool)

(assert (=> b!455183 m!439071))

(declare-fun m!439073 () Bool)

(assert (=> b!455189 m!439073))

(declare-fun m!439075 () Bool)

(assert (=> b!455177 m!439075))

(declare-fun m!439077 () Bool)

(assert (=> mapNonEmpty!19951 m!439077))

(declare-fun m!439079 () Bool)

(assert (=> b!455180 m!439079))

(check-sat (not b!455178) (not b!455177) (not b!455189) (not mapNonEmpty!19951) (not b_next!10869) (not start!40934) (not b!455179) (not b!455187) (not b!455183) (not b!455184) tp_is_empty!12207 (not b!455180) b_and!19011)
(check-sat b_and!19011 (not b_next!10869))
