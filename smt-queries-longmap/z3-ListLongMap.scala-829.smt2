; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20072 () Bool)

(assert start!20072)

(declare-fun mapNonEmpty!7949 () Bool)

(declare-fun mapRes!7949 () Bool)

(declare-fun tp!17237 () Bool)

(declare-fun e!129462 () Bool)

(assert (=> mapNonEmpty!7949 (= mapRes!7949 (and tp!17237 e!129462))))

(declare-datatypes ((V!5763 0))(
  ( (V!5764 (val!2338 Int)) )
))
(declare-datatypes ((ValueCell!1950 0))(
  ( (ValueCellFull!1950 (v!4308 V!5763)) (EmptyCell!1950) )
))
(declare-datatypes ((array!8431 0))(
  ( (array!8432 (arr!3966 (Array (_ BitVec 32) ValueCell!1950)) (size!4291 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8431)

(declare-fun mapKey!7949 () (_ BitVec 32))

(declare-fun mapValue!7949 () ValueCell!1950)

(declare-fun mapRest!7949 () (Array (_ BitVec 32) ValueCell!1950))

(assert (=> mapNonEmpty!7949 (= (arr!3966 _values!649) (store mapRest!7949 mapKey!7949 mapValue!7949))))

(declare-fun b!196539 () Bool)

(declare-fun e!129464 () Bool)

(assert (=> b!196539 (= e!129464 false)))

(declare-fun lt!97635 () Bool)

(declare-datatypes ((array!8433 0))(
  ( (array!8434 (arr!3967 (Array (_ BitVec 32) (_ BitVec 64))) (size!4292 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8433)

(declare-datatypes ((List!2478 0))(
  ( (Nil!2475) (Cons!2474 (h!3116 (_ BitVec 64)) (t!7409 List!2478)) )
))
(declare-fun arrayNoDuplicates!0 (array!8433 (_ BitVec 32) List!2478) Bool)

(assert (=> b!196539 (= lt!97635 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2475))))

(declare-fun res!92765 () Bool)

(assert (=> start!20072 (=> (not res!92765) (not e!129464))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20072 (= res!92765 (validMask!0 mask!1149))))

(assert (=> start!20072 e!129464))

(assert (=> start!20072 true))

(declare-fun e!129460 () Bool)

(declare-fun array_inv!2585 (array!8431) Bool)

(assert (=> start!20072 (and (array_inv!2585 _values!649) e!129460)))

(declare-fun array_inv!2586 (array!8433) Bool)

(assert (=> start!20072 (array_inv!2586 _keys!825)))

(declare-fun b!196540 () Bool)

(declare-fun e!129461 () Bool)

(declare-fun tp_is_empty!4587 () Bool)

(assert (=> b!196540 (= e!129461 tp_is_empty!4587)))

(declare-fun mapIsEmpty!7949 () Bool)

(assert (=> mapIsEmpty!7949 mapRes!7949))

(declare-fun b!196541 () Bool)

(assert (=> b!196541 (= e!129460 (and e!129461 mapRes!7949))))

(declare-fun condMapEmpty!7949 () Bool)

(declare-fun mapDefault!7949 () ValueCell!1950)

(assert (=> b!196541 (= condMapEmpty!7949 (= (arr!3966 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1950)) mapDefault!7949)))))

(declare-fun b!196542 () Bool)

(assert (=> b!196542 (= e!129462 tp_is_empty!4587)))

(declare-fun b!196543 () Bool)

(declare-fun res!92767 () Bool)

(assert (=> b!196543 (=> (not res!92767) (not e!129464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8433 (_ BitVec 32)) Bool)

(assert (=> b!196543 (= res!92767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196544 () Bool)

(declare-fun res!92766 () Bool)

(assert (=> b!196544 (=> (not res!92766) (not e!129464))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196544 (= res!92766 (and (= (size!4291 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4292 _keys!825) (size!4291 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20072 res!92765) b!196544))

(assert (= (and b!196544 res!92766) b!196543))

(assert (= (and b!196543 res!92767) b!196539))

(assert (= (and b!196541 condMapEmpty!7949) mapIsEmpty!7949))

(assert (= (and b!196541 (not condMapEmpty!7949)) mapNonEmpty!7949))

(get-info :version)

(assert (= (and mapNonEmpty!7949 ((_ is ValueCellFull!1950) mapValue!7949)) b!196542))

(assert (= (and b!196541 ((_ is ValueCellFull!1950) mapDefault!7949)) b!196540))

(assert (= start!20072 b!196541))

(declare-fun m!223783 () Bool)

(assert (=> mapNonEmpty!7949 m!223783))

(declare-fun m!223785 () Bool)

(assert (=> b!196539 m!223785))

(declare-fun m!223787 () Bool)

(assert (=> start!20072 m!223787))

(declare-fun m!223789 () Bool)

(assert (=> start!20072 m!223789))

(declare-fun m!223791 () Bool)

(assert (=> start!20072 m!223791))

(declare-fun m!223793 () Bool)

(assert (=> b!196543 m!223793))

(check-sat (not b!196539) (not mapNonEmpty!7949) tp_is_empty!4587 (not start!20072) (not b!196543))
(check-sat)
