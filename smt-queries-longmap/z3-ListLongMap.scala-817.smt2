; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19956 () Bool)

(assert start!19956)

(declare-fun res!92369 () Bool)

(declare-fun e!128828 () Bool)

(assert (=> start!19956 (=> (not res!92369) (not e!128828))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19956 (= res!92369 (validMask!0 mask!1149))))

(assert (=> start!19956 e!128828))

(assert (=> start!19956 true))

(declare-datatypes ((V!5667 0))(
  ( (V!5668 (val!2302 Int)) )
))
(declare-datatypes ((ValueCell!1914 0))(
  ( (ValueCellFull!1914 (v!4271 V!5667)) (EmptyCell!1914) )
))
(declare-datatypes ((array!8287 0))(
  ( (array!8288 (arr!3899 (Array (_ BitVec 32) ValueCell!1914)) (size!4224 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8287)

(declare-fun e!128827 () Bool)

(declare-fun array_inv!2533 (array!8287) Bool)

(assert (=> start!19956 (and (array_inv!2533 _values!649) e!128827)))

(declare-datatypes ((array!8289 0))(
  ( (array!8290 (arr!3900 (Array (_ BitVec 32) (_ BitVec 64))) (size!4225 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8289)

(declare-fun array_inv!2534 (array!8289) Bool)

(assert (=> start!19956 (array_inv!2534 _keys!825)))

(declare-fun b!195755 () Bool)

(declare-fun e!128826 () Bool)

(declare-fun tp_is_empty!4515 () Bool)

(assert (=> b!195755 (= e!128826 tp_is_empty!4515)))

(declare-fun mapNonEmpty!7826 () Bool)

(declare-fun mapRes!7826 () Bool)

(declare-fun tp!17114 () Bool)

(declare-fun e!128829 () Bool)

(assert (=> mapNonEmpty!7826 (= mapRes!7826 (and tp!17114 e!128829))))

(declare-fun mapKey!7826 () (_ BitVec 32))

(declare-fun mapRest!7826 () (Array (_ BitVec 32) ValueCell!1914))

(declare-fun mapValue!7826 () ValueCell!1914)

(assert (=> mapNonEmpty!7826 (= (arr!3899 _values!649) (store mapRest!7826 mapKey!7826 mapValue!7826))))

(declare-fun mapIsEmpty!7826 () Bool)

(assert (=> mapIsEmpty!7826 mapRes!7826))

(declare-fun b!195756 () Bool)

(assert (=> b!195756 (= e!128829 tp_is_empty!4515)))

(declare-fun b!195757 () Bool)

(assert (=> b!195757 (= e!128827 (and e!128826 mapRes!7826))))

(declare-fun condMapEmpty!7826 () Bool)

(declare-fun mapDefault!7826 () ValueCell!1914)

(assert (=> b!195757 (= condMapEmpty!7826 (= (arr!3899 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1914)) mapDefault!7826)))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195758 () Bool)

(assert (=> b!195758 (= e!128828 (and (= (size!4224 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4225 _keys!825) (size!4224 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (= (size!4225 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)) (bvsgt #b00000000000000000000000000000000 (size!4225 _keys!825))))))

(assert (= (and start!19956 res!92369) b!195758))

(assert (= (and b!195757 condMapEmpty!7826) mapIsEmpty!7826))

(assert (= (and b!195757 (not condMapEmpty!7826)) mapNonEmpty!7826))

(get-info :version)

(assert (= (and mapNonEmpty!7826 ((_ is ValueCellFull!1914) mapValue!7826)) b!195756))

(assert (= (and b!195757 ((_ is ValueCellFull!1914) mapDefault!7826)) b!195755))

(assert (= start!19956 b!195757))

(declare-fun m!223283 () Bool)

(assert (=> start!19956 m!223283))

(declare-fun m!223285 () Bool)

(assert (=> start!19956 m!223285))

(declare-fun m!223287 () Bool)

(assert (=> start!19956 m!223287))

(declare-fun m!223289 () Bool)

(assert (=> mapNonEmpty!7826 m!223289))

(check-sat (not start!19956) (not mapNonEmpty!7826) tp_is_empty!4515)
(check-sat)
(get-model)

(declare-fun d!57525 () Bool)

(assert (=> d!57525 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19956 d!57525))

(declare-fun d!57527 () Bool)

(assert (=> d!57527 (= (array_inv!2533 _values!649) (bvsge (size!4224 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19956 d!57527))

(declare-fun d!57529 () Bool)

(assert (=> d!57529 (= (array_inv!2534 _keys!825) (bvsge (size!4225 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19956 d!57529))

(declare-fun condMapEmpty!7832 () Bool)

(declare-fun mapDefault!7832 () ValueCell!1914)

(assert (=> mapNonEmpty!7826 (= condMapEmpty!7832 (= mapRest!7826 ((as const (Array (_ BitVec 32) ValueCell!1914)) mapDefault!7832)))))

(declare-fun e!128850 () Bool)

(declare-fun mapRes!7832 () Bool)

(assert (=> mapNonEmpty!7826 (= tp!17114 (and e!128850 mapRes!7832))))

(declare-fun mapIsEmpty!7832 () Bool)

(assert (=> mapIsEmpty!7832 mapRes!7832))

(declare-fun mapNonEmpty!7832 () Bool)

(declare-fun tp!17120 () Bool)

(declare-fun e!128849 () Bool)

(assert (=> mapNonEmpty!7832 (= mapRes!7832 (and tp!17120 e!128849))))

(declare-fun mapValue!7832 () ValueCell!1914)

(declare-fun mapKey!7832 () (_ BitVec 32))

(declare-fun mapRest!7832 () (Array (_ BitVec 32) ValueCell!1914))

(assert (=> mapNonEmpty!7832 (= mapRest!7826 (store mapRest!7832 mapKey!7832 mapValue!7832))))

(declare-fun b!195777 () Bool)

(assert (=> b!195777 (= e!128849 tp_is_empty!4515)))

(declare-fun b!195778 () Bool)

(assert (=> b!195778 (= e!128850 tp_is_empty!4515)))

(assert (= (and mapNonEmpty!7826 condMapEmpty!7832) mapIsEmpty!7832))

(assert (= (and mapNonEmpty!7826 (not condMapEmpty!7832)) mapNonEmpty!7832))

(assert (= (and mapNonEmpty!7832 ((_ is ValueCellFull!1914) mapValue!7832)) b!195777))

(assert (= (and mapNonEmpty!7826 ((_ is ValueCellFull!1914) mapDefault!7832)) b!195778))

(declare-fun m!223299 () Bool)

(assert (=> mapNonEmpty!7832 m!223299))

(check-sat (not mapNonEmpty!7832) tp_is_empty!4515)
(check-sat)
