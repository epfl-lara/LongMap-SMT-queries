; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92388 () Bool)

(assert start!92388)

(declare-fun res!697720 () Bool)

(declare-fun e!595192 () Bool)

(assert (=> start!92388 (=> (not res!697720) (not e!595192))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66046 0))(
  ( (array!66047 (arr!31759 (Array (_ BitVec 32) (_ BitVec 64))) (size!32296 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66046)

(assert (=> start!92388 (= res!697720 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32296 a!3488)) (bvslt (size!32296 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32296 a!3488))))))

(assert (=> start!92388 e!595192))

(assert (=> start!92388 true))

(declare-fun array_inv!24541 (array!66046) Bool)

(assert (=> start!92388 (array_inv!24541 a!3488)))

(declare-fun b!1049362 () Bool)

(declare-fun res!697719 () Bool)

(assert (=> b!1049362 (=> (not res!697719) (not e!595192))))

(declare-datatypes ((List!22041 0))(
  ( (Nil!22038) (Cons!22037 (h!23255 (_ BitVec 64)) (t!31340 List!22041)) )
))
(declare-fun noDuplicate!1504 (List!22041) Bool)

(assert (=> b!1049362 (= res!697719 (noDuplicate!1504 Nil!22038))))

(declare-fun b!1049363 () Bool)

(declare-fun e!595190 () Bool)

(assert (=> b!1049363 (= e!595192 e!595190)))

(declare-fun res!697721 () Bool)

(assert (=> b!1049363 (=> res!697721 e!595190)))

(declare-fun contains!6125 (List!22041 (_ BitVec 64)) Bool)

(assert (=> b!1049363 (= res!697721 (contains!6125 Nil!22038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049364 () Bool)

(assert (=> b!1049364 (= e!595190 (contains!6125 Nil!22038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92388 res!697720) b!1049362))

(assert (= (and b!1049362 res!697719) b!1049363))

(assert (= (and b!1049363 (not res!697721)) b!1049364))

(declare-fun m!970745 () Bool)

(assert (=> start!92388 m!970745))

(declare-fun m!970747 () Bool)

(assert (=> b!1049362 m!970747))

(declare-fun m!970749 () Bool)

(assert (=> b!1049363 m!970749))

(declare-fun m!970751 () Bool)

(assert (=> b!1049364 m!970751))

(check-sat (not start!92388) (not b!1049364) (not b!1049363) (not b!1049362))
(check-sat)
(get-model)

(declare-fun d!128079 () Bool)

(assert (=> d!128079 (= (array_inv!24541 a!3488) (bvsge (size!32296 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92388 d!128079))

(declare-fun d!128081 () Bool)

(declare-fun lt!463616 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!529 (List!22041) (InoxSet (_ BitVec 64)))

(assert (=> d!128081 (= lt!463616 (select (content!529 Nil!22038) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!595215 () Bool)

(assert (=> d!128081 (= lt!463616 e!595215)))

(declare-fun res!697745 () Bool)

(assert (=> d!128081 (=> (not res!697745) (not e!595215))))

(get-info :version)

(assert (=> d!128081 (= res!697745 ((_ is Cons!22037) Nil!22038))))

(assert (=> d!128081 (= (contains!6125 Nil!22038 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463616)))

(declare-fun b!1049387 () Bool)

(declare-fun e!595216 () Bool)

(assert (=> b!1049387 (= e!595215 e!595216)))

(declare-fun res!697744 () Bool)

(assert (=> b!1049387 (=> res!697744 e!595216)))

(assert (=> b!1049387 (= res!697744 (= (h!23255 Nil!22038) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049388 () Bool)

(assert (=> b!1049388 (= e!595216 (contains!6125 (t!31340 Nil!22038) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128081 res!697745) b!1049387))

(assert (= (and b!1049387 (not res!697744)) b!1049388))

(declare-fun m!970769 () Bool)

(assert (=> d!128081 m!970769))

(declare-fun m!970771 () Bool)

(assert (=> d!128081 m!970771))

(declare-fun m!970773 () Bool)

(assert (=> b!1049388 m!970773))

(assert (=> b!1049364 d!128081))

(declare-fun d!128087 () Bool)

(declare-fun lt!463617 () Bool)

(assert (=> d!128087 (= lt!463617 (select (content!529 Nil!22038) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!595217 () Bool)

(assert (=> d!128087 (= lt!463617 e!595217)))

(declare-fun res!697747 () Bool)

(assert (=> d!128087 (=> (not res!697747) (not e!595217))))

(assert (=> d!128087 (= res!697747 ((_ is Cons!22037) Nil!22038))))

(assert (=> d!128087 (= (contains!6125 Nil!22038 #b0000000000000000000000000000000000000000000000000000000000000000) lt!463617)))

(declare-fun b!1049389 () Bool)

(declare-fun e!595218 () Bool)

(assert (=> b!1049389 (= e!595217 e!595218)))

(declare-fun res!697746 () Bool)

(assert (=> b!1049389 (=> res!697746 e!595218)))

(assert (=> b!1049389 (= res!697746 (= (h!23255 Nil!22038) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049390 () Bool)

(assert (=> b!1049390 (= e!595218 (contains!6125 (t!31340 Nil!22038) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128087 res!697747) b!1049389))

(assert (= (and b!1049389 (not res!697746)) b!1049390))

(assert (=> d!128087 m!970769))

(declare-fun m!970775 () Bool)

(assert (=> d!128087 m!970775))

(declare-fun m!970777 () Bool)

(assert (=> b!1049390 m!970777))

(assert (=> b!1049363 d!128087))

(declare-fun d!128089 () Bool)

(declare-fun res!697760 () Bool)

(declare-fun e!595231 () Bool)

(assert (=> d!128089 (=> res!697760 e!595231)))

(assert (=> d!128089 (= res!697760 ((_ is Nil!22038) Nil!22038))))

(assert (=> d!128089 (= (noDuplicate!1504 Nil!22038) e!595231)))

(declare-fun b!1049403 () Bool)

(declare-fun e!595232 () Bool)

(assert (=> b!1049403 (= e!595231 e!595232)))

(declare-fun res!697761 () Bool)

(assert (=> b!1049403 (=> (not res!697761) (not e!595232))))

(assert (=> b!1049403 (= res!697761 (not (contains!6125 (t!31340 Nil!22038) (h!23255 Nil!22038))))))

(declare-fun b!1049404 () Bool)

(assert (=> b!1049404 (= e!595232 (noDuplicate!1504 (t!31340 Nil!22038)))))

(assert (= (and d!128089 (not res!697760)) b!1049403))

(assert (= (and b!1049403 res!697761) b!1049404))

(declare-fun m!970789 () Bool)

(assert (=> b!1049403 m!970789))

(declare-fun m!970791 () Bool)

(assert (=> b!1049404 m!970791))

(assert (=> b!1049362 d!128089))

(check-sat (not b!1049404) (not b!1049390) (not d!128087) (not d!128081) (not b!1049403) (not b!1049388))
(check-sat)
